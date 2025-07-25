# Laravel API Rehberi

Bu rehber, Laravel ile basit bir kitap API'si oluşturmayı amaçlamaktadır. Kitaplar, yazarlar ve kategoriler gibi temel CRUD işlemlerini içermektedir. Aynı zamanda JWT (JSON Web Token) ile kimlik doğrulama ve yetkilendirme işlemlerini de içermektedir.

## Proje Kurulumu

```bash
composer create-project laravel/laravel book_api
cd book_api
```

## Model ve Migration, Controller Oluşturma

```bash
php artisan make:model Author -mc --api
php artisan make:model Book -mc --api
php artisan make:model Category -mc --api
```

- `-mc` parametresi model,migration ve controller dosyalarını aynı anda oluşturur.
  - `--api` parametresi API için gerekli temel CRUD işlemlerini ekler.

## Migration Konfigürasyon

**Dosya:** `database/migrations/xxxx_xx_xx_create_authors_table.php`

<details>
<summary><b>create_authors_table.php</b></summary>

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('authors', function (Blueprint $table) {
            $table->id();
            $table->string('author_name');
            $table->boolean('is_active')->default(1);
            $table->softDeletes();
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('authors');
    }
};
```

**Dosya:** `database/migrations/xxxx_xx_xx_create_books_table.php`

<details>
<summary><b>create_books_table.php</b></summary>

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('books', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('description');
            $table->foreignId('author_id')->constrained()->cascadeOnDelete();
            $table->foreignId('category_id')->constrained()->cascadeOnDelete();
            $table->boolean('is_published')->default(0);
            $table->timestamp('published_at')->nullable();
            $table->softDeletes(); // Soft delete için
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('books');
    }
};
```

</details>

**Dosya:** `database/migrations/xxxx_xx_xx_create_categories_table.php`

<details>
<summary><b>create_categories_table.php</b></summary>

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('category_name');
            $table->softDeletes();
            $table->timestamps();
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('categories');
    }
};
```

</details>
Tabloları oluşturmak için migration dosyasını çalıştırın:

```bash
php artisan migrate
```

## Model Konfigürasyon

**Dosya:** `app/Models/Author.php`

<details>
<summary><b>Author.php</b></summary>

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Author extends Model
{
  use SoftDeletes;

    protected $fillable = [
        'author_name',
    ];

    public function books()
    {
        return $this->hasMany(Book::class);
    }
}
```

</details>

**Dosya:** `app/Models/Book.php`

<details>
<summary><b>Book.php</b></summary>

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{

    use SoftDeletes;

    protected $fillable = [
        'title', 'description', 'author_id', 'category_id', 'is_published', 'published_at',
    ];

    public function author()
    {
        return $this->belongsTo(Author::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
```

</details>

**Dosya:** `app/Models/Category.php`

<details>
<summary><b>Category.php</b></summary>

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
  use SoftDeletes;

    protected $fillable = [
        'category_name',
    ];

    public function books()
    {
        return $this->hasMany(Book::class);
    }
}
```

</details>

## Controller Konfigürasyon

**Dosya:** `app/Http/Controllers/AuthorController.php`

<details>
<summary><b>AuthorController.php</b></summary>

```php
<?php

namespace App\Http\Controllers;

use App\Models\Author;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function index()
    {

        return Author::all();
    }
    public function store(Request $request)
    {
        $author = Author::create($request->all());
        return $author;
    }
    public function show(Author $author)
    {
        return $author;
    }
    public function update(Request $request, Author $author)
    {
        $author->update($request->all());
        return $author;
    }

    public function destroy(Author $author)
    {

        $author->delete();
        return ["message" => "Author deleted successfully"];
    }
}
```

</details>

**Dosya:** `app/Http/Controllers/BookController.php`

<details>
<summary><b>BookController.php</b></summary>

```php
<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;

class BookController extends Controller
{
    public function index()
    {
        return Book::with(['author', 'category'])->get();
    }
    public function store(Request $request)
    {
        $book = Book::create($request->all());
        return $book;
    }
    public function show(Book $book)
    {
        return $book;
    }
    public function update(Request $request, Book $book)
    {
        $book->update($request->all());
        return $book;
    }

    public function destroy(Book $book)
    {

        $book->delete();
        return ["message" => "Book deleted successfully"];
    }
}
```

</details>

**Dosya:** `app/Http/Controllers/CategoryController.php`

<details>
<summary><b>CategoryController.php</b></summary>

```php
<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {

        return Category::all();
    }
    public function store(Request $request)
    {
        $category = Category::create($request->all());
        return $category;
    }
    public function show(Category $category)
    {
        return $category;
    }
    public function update(Request $request, Category $category)
    {
        $category->update($request->all());
        return $category;
    }

    public function destroy(Category $category)
    {

        $category->delete();
        return ["message" => "Category deleted successfully"];
    }
}
```

</details>

## Router Api Konfigürasyon

Route servis sağlayıcısını oluşturun:

```bash
php artisan make:provider RouteServiceProvider
```

**Dosya:** `app/Providers/RouteServiceProvider.php`

<details>
<summary><b>RouteServiceProvider.php</b></summary>

```php
<?php

namespace App\Providers;

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

```php
<?php

use App\Http\Controllers\AuthorController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CategoryController;
use Illuminate\Support\Facades\Route;

Route::apiResource('authors', AuthorController::class);
Route::apiResource('categories', CategoryController::class);
Route::apiResource('books', BookController::class);
```

Routerlarınızı kontrol etmek için aşağıdaki komutu kullanabilirsiniz:

```bash
php artisan route:list
```

## JWT Kurulum

```bash
composer require php-open-source-saver/jwt-auth
```

## JWT Yapılandırma

```bash
php artisan vendor:publish --provider="PHPOpenSourceSaver\JWTAuth\Providers\LaravelServiceProvider"
```

> **Note:** Bu komut, `config/jwt.php` dosyasını oluşturur.

## JWT Gizli Anahtar Oluşturma

```bash
php artisan jwt:secret
```

> **Note:** Bu komut, `.env` dosyasına `JWT_SECRET` anahtarını ekler.

## Auth Konfigürasyon

**Dosya:** `config/auth.php`

<details>
<summary><b>auth.php</b></summary>

```php

     'defaults' => [
        'guard' => env('AUTH_GUARD', 'api'),
        'passwords' => env('AUTH_PASSWORD_BROKER', 'users'),
    ],

 'guards' => [
        'api' => [
            'driver' => 'jwt',
            'provider' => 'users',
        ],
    ],
```

</details>

> **Notes:** Bu dosyada `17. satırda ` yer alan guard kısmındaki `web` yerine `api` yazılmalıdır.

> Bu dosyada 44.satıra `guards` bölümü eklenmelidir.

> `AUTH_GUARD` `.env` dosyasında `api` olarak ayarlanabilir.

```bash
AUTH_GUARD=api
```

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
php artisan make:controller AuthController
```

**Dosya:** `app/Http/Controllers/API/AuthController.php`

<details>
<summary><b>AuthController.php</b></summary>

```php
<?php

namespace App\Http\Controllers;

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

## Route Konfigürasyon

**Dosya:** `routes/api.php`

<details>
<summary><b>api.php</b></summary>

```php
<?php
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CategoryController;
use Illuminate\Support\Facades\Route;

// JWT Token olması gereken işlemler
Route::middleware('auth:api')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('profile', [AuthController::class, 'profile']);
    Route::post('refresh', [AuthController::class, 'refresh']);

    Route::apiResource('authors', AuthorController::class);
    Route::apiResource('categories', CategoryController::class);
    Route::apiResource('books', BookController::class);
});

// JWT Token olmayan işlemler
Route::controller(AuthController::class)->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
});
```

</details>

## Sunucu Başlatma

Sunucuyu başlatmak için aşağıdaki komutu kullanabilirsiniz:

```bash
php artisan serve
```
