## 🚨 Neden Merkezi Hata Yönetimi Önemlidir?

Geleneksel hata yönetimi, uygulama boyunca dağılmış istisna yakalama mantığına neden olur. Bu şu sorunları doğurur:

- API içinde **tutarsız hata yanıtları**
- Controller ve middleware'lerde **tekrarlanan hata yönetimi kodları**
- Uygulama büyüdükçe **bakımı zorlaşan hata formatları**
- Geliştiriciler için **kötü bir hata ayıklama deneyimi**
- Son kullanıcılar için **anlaşılması güç hata mesajları**

Laravel 12'nin `withExceptions()` metodu bu sorunları tek bir merkezden yöneterek çözer.

---

# 📦 `App\Exceptions\ApiExceptionHandler.php` – Açıklamalı Dökümantasyon

Bu sınıf, Laravel API uygulamanda oluşabilecek farklı hataları yakalayarak JSON formatında düzgün yanıtlar üretir ve log kaydı alır.

---

## 📌 1. `$handlers`: Hata sınıfı - method eşlemesi

```php
public static array $handlers = [
    AuthenticationException::class => 'handleAuthenticationException',
    ...
];
```

- Gelen hataların türüne göre hangi methodla işleneceğini belirler.
- Örn: `ValidationException` geldiğinde `handleValidationException()` çağrılır.

---

## 📌 2. Hata Türlerine Göre Methodlar

### 🔐 `handleAuthenticationException()`

Kullanıcı giriş yapmamışsa veya token yoksa döner.

```json
{
  "error": {
    "status": 401,
    "message": "Authentication required..."
  }
}
```

---

### 🚫 `handleAuthorizationException()`

Kullanıcının yetkisi yoksa (örneğin admin olmayan kullanıcı admin sayfasına girmeye çalışırsa).

---

### 🧪 `handleValidationException()`

Form doğrulama hatalarında çalışır. Alan bazlı hataları listeler.

```json
"validation_errors": [
  { "field": "email", "message": "Email is required." }
]
```

---

### 🔎 `handleNotFoundException()`

Veritabanında kayıt bulunamadıysa veya API endpoint’i yoksa döner (404).

---

### ❌ `handleMethodNotAllowedException()`

Yanlış HTTP methodu kullanıldığında döner (örneğin PUT yerine GET).

---

### 🌐 `handleHttpException()`

Genel HTTP hatalarını işler.

---

### 🛢️ `handleQueryException()`

Veritabanı hatalarını işler:

- **1451**: Başka kayıtlara bağlı veri silinmeye çalışıldı.
- **1062**: Benzersiz (unique) alan çakışması.
- Diğer tüm DB hatalarında genel mesaj döner.

---

## 🔍 `getExceptionType()`

Hatanın sınıf adını alır (örneğin `ValidationException`).

---

## 📝 `logException()`

Hatayı `storage/logs/laravel.log` dosyasına yazar. Ekstra bilgiler de loga eklenir:

- IP, URL, method, dosya, satır, hata mesajı, vs.

---

# ⚙️ `bootstrap/app.php` – Exception Entegrasyonu

Laravel 12'de uygulama yapılandırması `bootstrap/app.php` içinden yapılır.

---

## 🔧 `withExceptions(...)` Yapısı

```php
->withExceptions(function (Exceptions $exceptions) {
    $exceptions->render(function (Throwable $e, $request) {
        ...
    });
})
```

Tüm istisnalar burada `ApiExceptionHandler` sınıfı üzerinden yorumlanır.

---

## 🔁 Çalışma Akışı

1. Hata oluşur (örneğin `ValidationException`).
2. `$handlers` içinde eşleşme aranır.
3. Uygun `handleXException()` metodu çağrılır.
4. JSON yanıt döner.
5. Log yazılır.

---

## 🛑 Fallback: Tanımsız Hata

Eğer hata yukarıdaki türlerden değilse:

```json
{
  "error": {
    "status": 500,
    "message": "Server error"
  }
}
```

Bu da loglanır.

---

## 📋 Özet

| Hata Türü                     | HTTP Kodu | Açıklama            |
| ----------------------------- | --------- | ------------------- |
| AuthenticationException       | 401       | Giriş yapılmamış    |
| AuthorizationException        | 403       | Yetki yok           |
| ValidationException           | 422       | Form hatası         |
| ModelNotFoundException        | 404       | Kayıt bulunamadı    |
| NotFoundHttpException         | 404       | Route yok           |
| MethodNotAllowedHttpException | 405       | Yanlış method       |
| QueryException                | 409 / 500 | DB hataları         |
| Diğer her şey                 | 500       | Genel sunucu hatası |

---

## Kod Kısmı

`ApiExceptionHandler.php` dosyasını oluşturma:

```bash
mkdir -p app/Exceptions
touch app/Exceptions/ApiExceptionHandler.php
```

<details>
<summary><b>ApiExceptionHandler.php</b></summary>

```php
<?php
namespace App\Exceptions;

use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;

class ApiExceptionHandler
{
    /**
     * Map of exception classes to their handler methods
     */
    public static array $handlers = [
        AuthenticationException::class => 'handleAuthenticationException',
        AccessDeniedHttpException::class => 'handleAuthenticationException',
        AuthorizationException::class => 'handleAuthorizationException',
        ValidationException::class => 'handleValidationException',
        ModelNotFoundException::class => 'handleNotFoundException',
        NotFoundHttpException::class => 'handleNotFoundException',
        MethodNotAllowedHttpException::class => 'handleMethodNotAllowedException',
        HttpException::class => 'handleHttpException',
        QueryException::class => 'handleQueryException',
    ];

    /**
     * Handle authentication exceptions
     */
    public function handleAuthenticationException(
        AuthenticationException | AccessDeniedHttpException $e,
        Request $request
    ): JsonResponse {
        $this->logException($e, 'Authentication failed');

        return response()->json([
            'error' => [
                'type' => $this->getExceptionType($e),
                'status' => 401,
                'message' => 'Authentication required. Please provide valid credentials.',
                'timestamp' => now()->toISOString(),
            ],
        ], 401);
    }

    /**
     * Handle authorization exceptions
     */
    public function handleAuthorizationException(
        AuthorizationException $e,
        Request $request
    ): JsonResponse {
        $this->logException($e, 'Authorization failed');

        return response()->json([
            'error' => [
                'type' => $this->getExceptionType($e),
                'status' => 403,
                'message' => 'You do not have permission to perform this action.',
                'timestamp' => now()->toISOString(),
            ],
        ], 403);
    }

    /**
     * Handle validation exceptions
     */
    public function handleValidationException(
        ValidationException $e,
        Request $request
    ): JsonResponse {
        $errors = [];

        foreach ($e->errors() as $field => $messages) {
            foreach ($messages as $message) {
                $errors[] = [
                    'field' => $field,
                    'message' => $message,
                ];
            }
        }

        $this->logException($e, 'Validation failed', ['errors' => $errors]);

        return response()->json([
            'error' => [
                'type' => $this->getExceptionType($e),
                'status' => 422,
                'message' => 'The provided data is invalid.',
                'timestamp' => now()->toISOString(),
                'validation_errors' => $errors,
            ],
        ], 422);
    }

    /**
     * Handle not found exceptions
     */
    public function handleNotFoundException(
        ModelNotFoundException | NotFoundHttpException $e,
        Request $request
    ): JsonResponse {
        $this->logException($e, 'Resource not found');

        $message = $e instanceof ModelNotFoundException
        ? 'The requested resource was not found.'
        : "The requested endpoint '{$request->getRequestUri()}' was not found.";

        return response()->json([
            'error' => [
                'type' => $this->getExceptionType($e),
                'status' => 404,
                'message' => $message,
                'timestamp' => now()->toISOString(),
            ],
        ], 404);
    }

    /**
     * Handle method not allowed exceptions
     */
    public function handleMethodNotAllowedException(
        MethodNotAllowedHttpException $e,
        Request $request
    ): JsonResponse {
        $this->logException($e, 'Method not allowed');

        return response()->json([
            'error' => [
                'type' => $this->getExceptionType($e),
                'status' => 405,
                'message' => "The {$request->method()} method is not allowed for this endpoint.",
                'timestamp' => now()->toISOString(),
                'allowed_methods' => $e->getHeaders()['Allow'] ?? 'Unknown',
            ],
        ], 405);
    }

    /**
     * Handle general HTTP exceptions
     */
    public function handleHttpException(HttpException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'HTTP exception occurred');

        return response()->json([
            'error' => [
                'type' => $this->getExceptionType($e),
                'status' => $e->getStatusCode(),
                'message' => $e->getMessage() ?: 'An HTTP error occurred.',
                'timestamp' => now()->toISOString(),
            ],
        ], $e->getStatusCode());
    }

    /**
     * Handle database query exceptions
     */
    public function handleQueryException(QueryException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Database query failed', ['sql' => $e->getSql()]);

        // Handle specific database constraint violations
        $errorCode = $e->errorInfo[1] ?? null;

        switch ($errorCode) {
            case 1451: // Foreign key constraint violation
                return response()->json([
                    'error' => [
                        'type' => $this->getExceptionType($e),
                        'status' => 409,
                        'message' => 'Cannot delete this resource because it is referenced by other records.',
                        'timestamp' => now()->toISOString(),
                    ],
                ], 409);

            case 1062: // Duplicate entry
                return response()->json([
                    'error' => [
                        'type' => $this->getExceptionType($e),
                        'status' => 409,
                        'message' => 'A record with this information already exists.',
                        'timestamp' => now()->toISOString(),
                    ],
                ], 409);

            default:
                return response()->json([
                    'error' => [
                        'type' => $this->getExceptionType($e),
                        'status' => 500,
                        'message' => 'A database error occurred. Please try again later.',
                        'timestamp' => now()->toISOString(),
                    ],
                ], 500);
        }
    }

    /**
     * Extract a clean exception type name
     */
    private function getExceptionType(Throwable $e): string
    {
        $className = basename(str_replace('\\', '/', get_class($e)));
        return $className;
    }

    /**
     * Log exception with context
     */
    private function logException(Throwable $e, string $message, array $context = []): void
    {
        $logContext = array_merge([
            'exception' => get_class($e),
            'message' => $e->getMessage(),
            'file' => $e->getFile(),
            'line' => $e->getLine(),
            'url' => request()->fullUrl(),
            'method' => request()->method(),
            'ip' => request()->ip(),
        ], $context);

        Log::warning($message, $logContext);
    }
}
```

</details>

`bootstrap/app.php` dosyasını düzenleyin:

<details>

<summary><b>bootstrap/app.php</b></summary>

```php
<?php
// bootstrap/app.php
use App\Exceptions\ApiExceptionHandler;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        // Web rotalarının dosya yolu.
        web: __DIR__ . '/../routes/web.php',

        // API rotalarının dosya yolu.
        api: __DIR__ . '/../routes/api.php',

        // API rotalarının prefix'ini belirtir.
        apiPrefix: 'api',

        // Komut dosyasının dosya yolu.
        commands: __DIR__ . '/../routes/console.php',

        // Sağlık rotalarının dosya yolu.
        health: '/up',
    )

    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->alias([
            'jwt.auth' => \PHPOpenSourceSaver\JWTAuth\Http\Middleware\Authenticate::class,
            'jwt.refresh' => \PHPOpenSourceSaver\JWTAuth\Http\Middleware\RefreshToken::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        $exceptions->render(function (Throwable $e, $request) {
            $handler = new ApiExceptionHandler();

            foreach (ApiExceptionHandler::$handlers as $class => $method) {
                if ($e instanceof $class && method_exists($handler, $method)) {
                    return $handler->$method($e, $request);
                }
            }

            // default fallback
            return response()->json([
                'error' => [
                    'type' => (new \ReflectionClass($e))->getShortName(),
                    'status' => $e instanceof \Symfony\Component\HttpKernel\Exception\HttpExceptionInterface
                    ? $e->getStatusCode()
                    : 500,
                    'message' => $e->getMessage() ?: 'Server error',
                    'timestamp' => now()->toISOString(),
                ],
            ], $e instanceof \Symfony\Component\HttpKernel\Exception\HttpExceptionInterface
                ? $e->getStatusCode()
                : 500);
        });
    })
    ->create();
```

</details>

## Kaynak

- [Custom Error Handling](https://medium.com/@murilolivorato/mastering-exception-handling-in-laravel-12-centralized-error-management-guide-95df500cb4ba)
