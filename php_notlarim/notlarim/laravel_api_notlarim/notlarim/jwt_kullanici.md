## User Model Konfigürasyon

**Dosya:** `app/Models/User.php`

<details>
<summary><b>User.php</b></summary>

```php
<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
```

</details>

## Controller Konfigürasyon

Auth controller'ı oluşturma:

```bash
php artisan make:controller API/AuthController
```

**Dosya:** `app/Http/Controllers/API/AuthController.php`

<details>
<summary><b>AuthController.php</b></summary>

```php
<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    public function register(Request $request)
    {
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'message' => 'Kullanıcı başarıyla kaydedildi',
            'user' => $user,
        ]);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $token = Auth::attempt($credentials);

        if (!$token) {
            return response()->json(['error' => 'Email veya şifre yanlış'], 401);
        }

        $user = Auth::user();
        return response()->json([
            'message' => 'Giriş başarılı',
            'user' => $user,
            'authorisation' => [
                'token' => $token,
                'type' => 'bearer',
            ],
        ]);
    }

    public function profile()
    {
        return response()->json(Auth::user());
    }

    public function logout()
    {
        Auth::logout();
        return response()->json(['message' => 'Çıkış başarılı.']);
    }

    public function refresh()
    {
        $user = Auth::user();
        $token = Auth::refresh();
        return response()->json([
            'message' => 'Yenileme başarılı',
            'user' => $user,
            'authorisation' => [
                'token' => $token,
                'type' => 'bearer',
            ],
        ]);
    }
}
```

</details>

**Dosya:** `app/Http/Controllers/Controller.php`

<details>
<summary><b>Controller.php</b></summary>

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

abstract class Controller extends BaseController
{
    //
    use AuthorizesRequests, ValidatesRequests;
}
```

</details>
