# Router Adımları

## Configure Route Provider

```bash
php artisan make:provider RouteServiceProvider
```

**Dosya:** `app/Providers/RouteServiceProvider.php`

<details>
<summary><b>RouteServiceProvider.php</b></summary>

```php
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
   public function boot(): void
    {
        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }
}
```

</details>

Api rotalarını tanımlamak için `routes/api.php` dosyasını oluşturun:

```bash
touch routes/api.php
```

**Dosya:** `routes/api.php`

<details>
<summary><b>api.php</b></summary>

```php
<?php
use App\Http\Controllers\API\BlogController;
use Illuminate\Support\Facades\Route;

Route::apiResource('blogs', BlogController::class);
```

</details>

Routerlarınızı kontrol etmek için aşağıdaki komutu kullanabilirsiniz:

```bash
php artisan route:list
```

## Sunucuyu Başlatma

```bash
php artisan serve

```
