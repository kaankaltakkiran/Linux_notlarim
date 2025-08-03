# Laravel API Hata Yönetimi

## 1. Adım: Debug Modunu Kapatma

Önce `.env` dosyanızda **debug modunu kapatın**. Böylece kullanıcıya Laravel’in detaylı hata sayfası (stack trace vs.) dönmez:

```dotenv
APP_DEBUG=false
```

> **Not:** `APP_DEBUG=true` sadece geliştirme aşamasında olsun. Production ortamında mutlaka `false` olmalı.

---

## 2. Adım: Hata Mesajlarını Düzenleme

`bootstrap/app.php` dosyasında hata mesajlarını düzenleyebilirsiniz.

```php
<?php
// bootstrap/app.php

use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

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

    ->withExceptions(function (Exceptions $exceptions): void {
        $exceptions->render(function (\Throwable $e, $request) {
            if ($request->expectsJson() || $request->is('api/*')) {

                if ($e instanceof ValidationException) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Doğrulama hatası.',
                        'errors' => $e->errors(),
                    ], 422);
                }

                if ($e instanceof AuthenticationException) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Giriş yapmanız gerekiyor.',
                    ], 401);
                }

                if ($e instanceof ModelNotFoundException) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Kayıt bulunamadı.',
                    ], 404);
                }

                if ($e instanceof NotFoundHttpException) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Geçersiz istek yada rota',
                    ], 404);
                }

                return response()->json([
                    'success' => false,
                    'message' => 'Sunucuda beklenmeyen bir hata oluştu.',
                ], 500);
            }

            // API değilse Laravel varsayılan hataları gösterir.
            return null;
        });
    })
    ->create();
```

### HTTP Durum Kodları Anlamları

| Durum Kodu | Anlamı           |
| ---------- | ---------------- |
| `422`      | Doğrulama Hatası |
| `401`      | Giriş Gerekli    |
| `404`      | Kayıt Bulunamadı |
| `500`      | Bilinmeyen Hata  |

## Hata Yönetimi

Kamp için oluşturulan ürün-category laravel api projesi örneği için öneri.

`app/Http/Controllers/AuthController` register fonksiyonu.

```php

public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|confirmed|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        $user = User::create(array_merge(
            $validator->validated(),
            ['password' => Hash::make($request->password)]
        ));

        return response()->json([
            'message' => 'User successfully registered',
            'user' => $user,
        ], 201);
    }
```

Örneğin bu kodda validsyon fail durumu bu şeklilde:

```php
  if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
```

Bu şekilde olunca response json formatında fakat string içersinde oluyor:

```json
"{\"email\":[\"The email field must be a valid email address.\"]}"
```

Eğer `$validator->fails()` kısmını şu şekilde değiştirerek daha anlamlı response alabiliriz:

```php
   if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }
```

Bu şekilde olursa response:

```json
{
  "success": false,
  "message": "The email field must be a valid email address.",
  "errors": {
    "email": ["The email field must be a valid email address."]
  }
}
```
