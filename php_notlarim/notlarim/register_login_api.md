```php
<?php
// CORS tanımları
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With, Origin, Accept");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 86400");

// JWT için gerekli sabitler
define('JWT_SECRET_KEY', 'your-256-bit-secret'); // Güvenli bir secret key kullanın
define('JWT_EXPIRE_TIME', 3600); // Token geçerlilik süresi (1 saat)

// Preflight (OPTIONS) isteğine yanıt verin
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit();
}

// Veritabanı baglantısı

class Database {
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $database = 'register_login_db';
    public $connection;

    public function __construct() {
        $this->connection = new mysqli($this->host, $this->username, $this->password, $this->database);

        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }
    }

    public function closeConnection() {
        $this->connection->close();
    }
}



// JWT fonksiyonları
function generateJWT($user) {
    $issuedAt = time();
    $expire = $issuedAt + JWT_EXPIRE_TIME;

    $payload = [
        'iat' => $issuedAt,
        'exp' => $expire,
        'user_id' => $user['id'],
        'username' => $user['username'],
        'email' => $user['email']
    ];

    // JWT oluşturma (base64 ile)
    $header = base64_encode(json_encode(['typ' => 'JWT', 'alg' => 'HS256']));
    $payload = base64_encode(json_encode($payload));
    $signature = base64_encode(hash_hmac('sha256', "$header.$payload", JWT_SECRET_KEY, true));

    return "$header.$payload.$signature";
}

function verifyJWT($token) {
    try {
        $tokenParts = explode('.', $token);
        if (count($tokenParts) != 3) {
            return false;
        }

        $header = base64_decode($tokenParts[0]);
        $payload = base64_decode($tokenParts[1]);
        $signature = $tokenParts[2];

        // Signature doğrulama
        $valid = base64_encode(hash_hmac('sha256', "$tokenParts[0].$tokenParts[1]", JWT_SECRET_KEY, true)) === $signature;
        if (!$valid) {
            return false;
        }

        $payload = json_decode($payload, true);
        // Süre kontrolü
        if (isset($payload['exp']) && $payload['exp'] < time()) {
            return false;
        }

        return $payload;
    } catch (Exception $e) {
        return false;
    }
}

// Gelen ham veriyi okuma
$data = json_decode(file_get_contents("php://input"), true);
$METHOD = $data['method'] ?? '';

$response = ['success' => false];

// Veritabanı bağlantısı
$db = new Database();
$DB = $db->connection;

// Token kontrolü gerektiren endpointler için
$protected_methods = ['get-users', 'get-user', 'update-user', 'delete-user'];
if (in_array($METHOD, $protected_methods)) {
    $headers = getallheaders();
    $token = isset($headers['Authorization']) ? str_replace('Bearer ', '', $headers['Authorization']) : null;

    if (!$token || !($payload = verifyJWT($token))) {
        header('HTTP/1.0 401 Unauthorized');
        echo json_encode(['success' => false, 'error' => 'Unauthorized access']);
        exit();
    }
    // Token geçerliyse kullanıcı bilgilerini data'ya ekle
    $data['user_id'] = $payload['user_id'];
}

// Metodlara göre işlemleri yönlendirme
switch ($METHOD) {
    case 'register':
        $response = registerUser($DB, $data);
        break;

    case 'login':
        $response = loginUser($DB, $data);
        break;

    case 'get-users':
        $response = getUsers($DB);
        break;

    case 'get-user':
        $response = getUser($DB, $data);
        break;

    case 'update-user':
        $response = updateUser($DB, $data);
        break;

    case 'delete-user':
        $response = deleteUser($DB, $data);
        break;

    default:
        $response['error'] = "invalid method";
}

// JSON formatında yanıt döndürme
header('Content-Type: application/json');
echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
$db->closeConnection();

// Kullanıcı kaydı oluşturma
function registerUser($DB, $data) {
    $response = ['success' => false];

    try {
        // Begin transaction
        $DB->begin_transaction();

        // Check duplicates in a single query
        $stmt = $DB->prepare("SELECT COUNT(*) as count FROM users WHERE email = ? OR username = ?");
        $stmt->bind_param("ss", $data['email'], $data['username']);
        $stmt->execute();
        $result = $stmt->get_result();
        $count = $result->fetch_assoc()['count'];

        if ($count > 0) {
            // Check which one is duplicate
            $stmt = $DB->prepare("SELECT email, username FROM users WHERE email = ? OR username = ?");
            $stmt->bind_param("ss", $data['email'], $data['username']);
            $stmt->execute();
            $result = $stmt->get_result();
            $row = $result->fetch_assoc();

            if ($row['email'] === $data['email']) {
                $response['error'] = "This email is already in use";
            } else {
                $response['error'] = "This username is already in use";
            }

            $DB->rollback();
            return $response;
        }

        $hash = password_hash($data['password'], PASSWORD_DEFAULT);
        $stmt = $DB->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $data['username'], $data['email'], $hash);

        if ($stmt->execute()) {
            $response['success'] = true;
            $response['message'] = "User registered successfully";
            $response['user_id'] = $stmt->insert_id;
            $DB->commit();
        } else {
            $response['error'] = "User registration failed";
            $DB->rollback();
        }
    } catch (Exception $e) {
        $DB->rollback();
        $response['error'] = "Database error: " . $e->getMessage();
    }

    return $response;
}

// Kullanıcı giriş işlemi
function loginUser($DB, $data) {
    $response = ['success' => false];

    try {
        $stmt = $DB->prepare("SELECT id, username, email, password FROM users WHERE email = ?");
        $stmt->bind_param("s", $data['email']);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            if (password_verify($data['password'], $user['password'])) {
                // Hassas bilgileri kaldır
                unset($user['password']);

                // JWT token oluştur
                $token = generateJWT($user);

                $response['success'] = true;
                $response['message'] = "Logged in successfully";
                $response['token'] = $token;
                $response['user'] = $user;
            } else {
                $response['error'] = "Wrong password or email";
            }
        } else {
            $response['error'] = "User not found";
        }
    } catch (Exception $e) {
        $response['error'] = $e->getMessage();
    }

    return $response;
}

// Tüm kullanıcıları listeleme
function getUsers($DB) {
    $response = ['success' => false];

    try {
        $stmt = $DB->prepare("SELECT id, username, email FROM users");
        $stmt->execute();
        $users = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

        $response['success'] = true;
        $response['users'] = $users;
    } catch (Exception $e) {
        $response['error'] = $e->getMessage();
    }

    return $response;
}

// Belirli bir kullanıcıyı getirme
function getUser($DB, $data) {
    $response = ['success' => false];

    try {
        $stmt = $DB->prepare("SELECT id, username, email FROM users WHERE id = ?");
        $stmt->bind_param("i", $data['user_id']);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $response['success'] = true;
            $response['user'] = $result->fetch_assoc();
        } else {
            $response['error'] = "User not found";
        }
    } catch (Exception $e) {
        $response['error'] = $e->getMessage();
    }

    return $response;
}

// Kullanıcı bilgilerini güncelleme
function updateUser($DB, $data) {
    $response = ['success' => false];

    try {
        $stmt = $DB->prepare("UPDATE users SET username = ?, email = ? WHERE id = ?");
        $stmt->bind_param("ssi", $data['username'], $data['email'], $data['user_id']);

        if ($stmt->execute()) {
            $response['success'] = true;
            $response['message'] = "User updated successfully";
        } else {
            $response['error'] = "User update failed";
        }
    } catch (Exception $e) {
        $response['error'] = $e->getMessage();
    }

    return $response;
}

// Kullanıcıyı silme
function deleteUser($DB, $data) {
    $response = ['success' => false];

    try {
        $stmt = $DB->prepare("DELETE FROM users WHERE id = ?");
        $stmt->bind_param("i", $data['user_id']);

        if ($stmt->execute()) {
            $response['success'] = true;
            $response['message'] = "User deleted successfully";
        } else {
            $response['error'] = "User delete failed";
        }
    } catch (Exception $e) {
        $response['error'] = $e->getMessage();
    }

    return $response;
}


```
