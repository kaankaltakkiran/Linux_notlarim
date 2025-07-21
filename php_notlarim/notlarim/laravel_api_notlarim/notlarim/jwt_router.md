## Route Konfigürasyon

**Dosya:** `routes/api.php`

<details>
<summary><b>api.php</b></summary>

```php
<?php
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BlogController;
use Illuminate\Support\Facades\Route;

Route::apiResource('blogs', BlogController::class);

// JWT Token olması gereken işlemler
Route::middleware('auth:api')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('profile', [AuthController::class, 'profile']);
    Route::post('refresh', [AuthController::class, 'refresh']);
});

// JWT Token olmayan işlemler
Route::controller(AuthController::class)->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
});
```

</details>
