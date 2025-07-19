# Router Adımları

**Dosya:** `routes/api.php`

```php
use App\Http\Controllers\NoteController;
use Illuminate\Support\Facades\Route;

Route::apiResource('notes', NoteController::class);
```
Routerlarınızı kontrol etmek için aşağıdaki komutu kullanabilirsiniz:
```bash
php artisan route:list
```
## Not API Uç Noktaları

Bu tablo, not yönetimi için mevcut API uç noktalarını detaylandırmaktadır:

| Alan (Domain)                       | Yöntem       | URI                 | Rota Adı         | Eylem                                          |
| :---------------------------------- | :----------- | :------------------ | :--------------- | :--------------------------------------------- |
| `http://127.0.0.1:8000/api/notes`   | `GET|HEAD`   | `/api/notes`        | `notes.index`    | `App\Http\Controllers\NoteController@index`    |
| `http://127.0.0.1:8000/api/notes`   | `POST`       | `/api/notes`        | `notes.store`    | `App\Http\Controllers\NoteController@store`    |
| `http://127.0.0.1:8000/api/notes/{:id}` | `GET|HEAD`   | `/api/notes/{note}` | `notes.show`     | `App\Http\Controllers\NoteController@show`     |
| `http://127.0.0.1:8000/api/notes/{:id}` | `PUT|PATCH`  | `/api/notes/{note}` | `notes.update`   | `App\Http\Controllers\NoteController@update`   |
| `http://127.0.0.1:8000/api/notes/{:id}` | `DELETE`     | `/api/notes/{note}` | `notes.destroy`  | `App\Http\Controllers\NoteController@destroy`  |

---

Bu çıktıda, `notes` kaynakları için gerekli tüm API rotaları listelenmiştir.

## Sunucuyu Başlatma
```bash
php artisan serve

