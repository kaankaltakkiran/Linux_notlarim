# Router Adımları

## Configure Route Provider

```bash
php artisan make:provider RouteServiceProvider
```

**Dosya:** `app/Providers/RouteServiceProvider.php`

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

Api rotalarını tanımlamak için `routes/api.php` dosyasını oluşturun:

```bash
touch routes/api.php
```

**Dosya:** `routes/api.php`

```php
<?php
use App\Http\Controllers\API\BlogController;
use Illuminate\Support\Facades\Route;

Route::apiResource('blogs', BlogController::class);
```

Routerlarınızı kontrol etmek için aşağıdaki komutu kullanabilirsiniz:

```bash
php artisan route:list
```

## Not API Uç Noktaları

Bu tablo, not yönetimi için mevcut API uç noktalarını detaylandırmaktadır:

| Alan (Domain)                           | Yöntem   | URI                 | Rota Adı            | Eylem                                         |
| :-------------------------------------- | :------- | :------------------ | :------------------ | :-------------------------------------------- | -------------------------------------------- |
| `http://127.0.0.1:8000/api/blogs`       | `GET     | HEAD`               | `/api/blogs`        | `blogs.index`                                 | `App\Http\Controllers\BlogController@index`  |
| `http://127.0.0.1:8000/api/blogs`       | `POST`   | `/api/blogs`        | `blogs.store`       | `App\Http\Controllers\BlogController@store`   |
| `http://127.0.0.1:8000/api/blogs/{:id}` | `GET     | HEAD`               | `/api/blogs/{blog}` | `blogs.show`                                  | `App\Http\Controllers\BlogController@show`   |
| `http://127.0.0.1:8000/api/blogs/{:id}` | `PUT     | PATCH`              | `/api/blogs/{blog}` | `blogs.update`                                | `App\Http\Controllers\BlogController@update` |
| `http://127.0.0.1:8000/api/blogs/{:id}` | `DELETE` | `/api/blogs/{blog}` | `blogs.destroy`     | `App\Http\Controllers\BlogController@destroy` |

---

Bu çıktıda, `blogs` kaynakları için gerekli tüm API rotaları listelenmiştir.

## Sunucuyu Başlatma

```bash
php artisan serve

```
