# Laravel Örnek Api(Sanctum) Oluşturma Rehberi

Laravel ile kullanıcı ve post işlemlerini gerçekleştiren basit bir CRUD api örneği.

## Laravel Projesi Oluşturma

```bash
laravel new laravel-api-example
cd laravel-api-example
```

> ** Notes:** Başlangıç kiti ister misinz sorusuna `None` seçeneğini seçin.

> Hangisi veritabanı kullanmak istersiniz sorusuna `MySQL` seçeneğini seçin.

> Database migrationları çalıştırmak istermisinz sorusuna `yes` seçeneğini seçin.

> npm install ve npm run dev komutlarını çalıştırmak istermisinz sorusuna `yes` seçeneğini seçin.

## `.env` Dosyasında Veritabanı Bağlantı Bilgileri Düzenleme

`.env` dosyasında veritabanı bağlantısı için `DB_CONNECTION`, `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME` ve `DB_PASSWORD` değerlerini kendi veritabanı bilgilerinizle doldurun. Örnek bir `.env` dosyası aşağıdaki gibi olabilir:

```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_todo_api
DB_USERNAME={kullanıcı_adınız}
DB_PASSWORD={şifreniz}
```

## Api İçin [Sanctum](https://laravel.com/docs/12.x/sanctum#main-content) Kurulumu

```bash
php artisan install:api
```

> ** Note:** Veritabanında yeni migrationlar oluşturuldu. Çalıştırmak ister misiniz ? diye bir soru sorulacak. `yes` demek için `enter` tuşuna basın.

> ** Note:** Henüz veritabanını oluşturmadıysanız bu komutu yazdıktan sonra oluşturmak istermisinz diye soracaktır. `yes` seçeneğini seçin.

## Router listeleme

```bash
php artisan route:list
```

## Post için Model, Migration ve Controller Oluşturma

```bash
php artisan make:model Post -a --api
```

> ** Not:** `-a` parametresi model için migration, controller ve factory dosyalarını da oluşturur. `--api` parametresi ise sadece api için gerekli olan metodları oluşturur.

## Migration İle Tabloları Oluşturma

```bash
php artisan migrate
```

## Post Modelini Düzenleme

`app/Models/Post.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Not:** `Post` modelindeki `fillable` özelliği, hangi alanların veritabanına kaydedileceğini belirtir. Bu özellik sayesinde, sadece belirtilen alanlar için veri kaydedilebilir.

> user ile ilişkili postları çekebilmek için `user` metodunu ekliyoruz. Bu metod, `Post` modelinin `User` modeline ait olduğunu belirtir ve `belongsTo` ilişkisini kullanır.

> `belengsTo` ilişkisi, bir postun bir kullanıcıya ait olduğunu belirtir. Bu ilişki sayesinde, bir postun sahibi olan kullanıcıya kolayca erişebiliriz.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use HasFactory;

    protected $fillable = [
        'title',
        'body',
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
}
```

## Post Migration Dosyasını Düzenleme

`database/migrations/{tarih}_create_posts_table.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Note:** `posts` tablosuna `user_id` alanını ekliyoruz. Bu alan, postun sahibi olan kullanıcının id'sini tutar. `foreign` anahtar olarak `users` tablosuna referans verir.

> `constrained` metodu, `user_id` alanının `users` tablosundaki `id` alanına referans verdiğini belirtir. Bu sayede, postların hangi kullanıcıya ait olduğunu belirleyebiliriz.

> `cascadeOnDelete` metodu, eğer kullanıcı silinirse ona ait tüm postların da silinmesini sağlar. Bu sayede, kullanıcı silindiğinde ona ait tüm postlar da otomatik olarak silinir.

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   /*  veritabanına tablo oluşturur */
    public function up(): void
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->string('title');
            $table->text('body');
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
```

> ** Note:** Migration dosyasını düzenledikten sonra, veritabanında değişiklikleri uygulamak için aşağıdaki komutu çalıştırın:

```bash
php artisan migrate:fresh
```

## User Model Düzenleme

`app/Models/User.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Note:** `User` modelinde `HasApiTokens` trait'ini kullanarak, kullanıcıların api tokenlerini oluşturmasını sağlıyoruz. Bu sayede, kullanıcılar api isteklerinde kimlik doğrulaması yapabilirler.

> posts fonksiyonunu ekliyoruz. Bu fonksiyon, kullanıcının sahip olduğu postları getirir. `hasMany` ilişkisi kullanarak, bir kullanıcının birden fazla postu olabileceğini belirtiriz.

```php
<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable,HasApiTokens;

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
    public function posts(){
        return $this->hasMany(Post::class);
    }
}
```

## Router Dosyasını Düzenleme

`routes/api.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Note:** `apiResource` metodu, `PostController` içinde CRUD işlemlerini gerçekleştirmek için gerekli olan `index`, `show`, `store`, `update` ve `destroy` metodlarını otomatik olarak oluşturur.

> `apiResource` metodu, `posts` adında bir kaynak oluşturur ve bu kaynağa ait tüm CRUD işlemlerini otomatik olarak tanımlar.

> Örnek api istekleri: `http://127.0.0.1:8000/api/posts`, `http://127.0.0.1:8000/api/register`,`http://127.0.0.1:8000/api/login` > `auth:sanctum` middleware'i, kullanıcının kimliğini doğrulamak için kullanılır. Bu middleware, kullanıcının kimliğini doğruladıktan sonra, kullanıcının kimliğini `Request` nesnesine ekler. Böylece, kullanıcının kimliğine erişebiliriz.

> `AuthController` içinde `register`, `login` ve `logout` metodlarını tanımlıyoruz. Bu metodlar, kullanıcının kayıt olmasını, giriş yapmasını ve çıkış yapmasını sağlar.

> `routes/web.php` dosyasının içeriğini silebilirsiniz, çünkü bu dosya web uygulamaları için kullanılır. Biz sadece api oluşturuyoruz.

> Logouttaki `auth:sanctum` middleware'i ile koruyoruz. Bu sayede, sadece authenticated kullanıcılar çıkış yapabilir.

```php
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\AuthController;

 Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('posts',PostController::class);
Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);
Route::post('/logout',[AuthController::class,'logout'])->middleware('auth:sanctum');
```

> ** Note:** `routes/api.php` dosyasını düzenledikten sonra, `php artisan route:list` komutunu çalıştırarak routerların doğru bir şekilde eklendiğini kontrol edebilirsiniz.

## Post Controller Düzenleme

`app/Http/Controllers/PostController.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Note:** `PostController` içinde `index`, `store`, `show`, `update` ve `destroy` metodlarını tanımlıyoruz. Bu metodlar, postların listelenmesi, oluşturulması, gösterilmesi, güncellenmesi ve silinmesi işlemlerini gerçekleştirir.

> `HasMiddleware` arayüzünü kullanarak, `middleware` metodunu tanımlıyoruz. Bu metod, `auth:sanctum` middleware'ini kullanarak, sadece authenticated kullanıcıların post oluşturmasını sağlar. `except` parametresi ile `index` ve `show` metodları dışındaki tüm metodlara `auth:sanctum` middleware'ini uygular.

> `Gate` sınıfını kullanarak, kullanıcının postu güncelleme veya silme yetkisini kontrol ediyoruz.

```php
<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Gate;

class PostController extends Controller implements HasMiddleware
{
    public static function middleware()
    {
       return [ new Middleware('auth:sanctum',except:['index','show'])];
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
         //Kullanıcı bilgileri ile birlikte en son postları getirir.
         return Post::with('user')->latest()->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //Postları veritabanına kaydeder.

        //Postları validasyon yapar.
        $fields=$request->validate([
            'title' => ['required', 'max:255'],
            'body' => 'required',
        ]);

       //Validate edilen Kullanıcıya ait postları veritabanına kaydeder.
        $post=$request->user()->posts()->create($fields);
        //Post ve kullanıcının bilgilerini geri döndürür.
        return [
            'post'=>$post,
            'user'=>$post->user,
        ];
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        //Belirli bir postu getirir.
         //Post ve kullanıcının bilgilerini geri döndürür.
            return [
            'post'=>$post,
            'user'=>$post->user,
        ];
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        //Verileri güncelleme

        //Postun sahibi mi kontrol et
         Gate::authorize('modify', $post);

        //Postları validasyon yapar.
        $fields=$request->validate([
            'title' => ['required', 'max:255'],
            'body' => 'required',
        ]);

       //Güncellenen verileri post tablosuna kaydeder.
        $post->update($fields);
        //Güncellenen postları döndürür.
        return $post;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
         //Postu silme

        //Postun sahibi mi kontrol et
        Gate::authorize('modify',$post);

        //Verileri silme
        $post->delete();
        //mesaj dönme
        return ['message'=>'Post deleted successfully.'];
    }
}
```

## Post Policy Düzenleme

`app/Policies/PostPolicy.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Note:** `PostPolicy` içinde `modify` metodunu tanımlıyoruz. Bu metod, kullanıcının postu güncelleme veya silme yetkisini kontrol eder. Eğer kullanıcı postun sahibi ise `true`, değilse `false` döner.

```php
<?php

namespace App\Policies;

use App\Models\Post;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class PostPolicy
{
    public function modify(User $user, Post $post): Response
    {
        return $user->id === $post->user_id
            ? Response::allow()
            : Response::deny('You do not own this post');
    }
}
```

## AuthController Oluşturma

`app/Http/Controllers/AuthController.php` dosyasını aşağıdaki gibi oluşturun:

```bash
php artisan make:controller AuthController
```

`app/Http/Controllers/AuthController.php` dosyasını aşağıdaki gibi düzenleyin:

> ** Note:** `AuthController` içinde `register`, `login` ve `logout` metodlarını tanımlıyoruz. Bu metodlar, kullanıcının kayıt olmasını, giriş yapmasını ve çıkış yapmasını sağlar.

> `register` metodunda, gelen isteği validate ediyoruz ve veritabanına kaydediyoruz. Kullanıcıya ait bir token oluşturuyoruz ve kullanıcı bilgilerini ve tokeni döndürüyoruz.

> `login` metodunda, gelen isteği validate ediyoruz ve veritabanında kullanıcının email ve şifresini kontrol ediyoruz. Eğer kullanıcı bulunamazsa veya şifre eşleşmezse hata mesajı döndürüyoruz. Eğer kullanıcı bulunursa, token oluşturuyoruz ve kullanıcı bilgilerini ve tokeni döndürüyoruz.

> `logout` metodunda, kullanıcının tokenini siliyoruz ve başarılı bir şekilde çıkış yapıldığını belirten bir mesaj döndürüyoruz.

> `Hash::check` metodu, gelen istekteki şifre ile veritabanındaki şifreyi karşılaştırır. Eğer şifreler eşleşirse `true`, eşleşmezse `false` döner. Bu sayede, kullanıcının şifresinin doğru olup olmadığını kontrol edebiliriz.

> `createToken` metodu, kullanıcının adını alarak bir token oluşturur. Bu token, kullanıcının kimliğini doğrulamak için kullanılır. `plainTextToken` özelliği, tokenin düz metin halini döndürür. Bu token, kullanıcının kimliğini doğrulamak için kullanılır ve her kullanıcı için benzersizdir.

> `unique:users`, email alanının veritabanında benzersiz olmasını sağlar. Bu sayede, aynı email ile birden fazla kullanıcı kaydedilemez.

> `confirmed, password` alanının doğrulama işlemini yapar. Bu sayede, kullanıcı şifresini iki kez girerek doğrulama yapar. Eğer şifreler eşleşmezse, hata mesajı döndürülür.

> `exists:users`, email alanının veritabanında var olup olmadığını kontrol eder. Bu sayede, giriş yapmaya çalışan kullanıcının email adresinin veritabanında kayıtlı olup olmadığını kontrol edebiliriz.
> `

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //
    public function register( Request $request){
        $fields=$request->validate([
            'name'=>'required|max:255',
            'email'=>'required|email|unique:users',
            'password'=>'required|confirmed'
        ]);
        $user=User::create($fields);
        //$token=$user->createToken($request->name);
         $token = $user->createToken($request->name, expiresAt: now()->addDay());
        return[
         'user'=>$user,
         'token'=>$token->plainTextToken
        ];
    }
    public function login( Request $request){
         $request->validate([
            'email'=>'required|email|exists:users',
            'password'=>'required'
        ]);
         $user=User::where('email',$request->email)->first();
          if(!$user || !Hash::check($request->password,$user->password)){
            return [
              'errors'=>[
                'email'=>[
                  'The provided credentials do not match our records'
                ]
              ]
                ];
          }
        //$token=$user->createToken($user->name);
          $token = $user->createToken($user->name, expiresAt: now()->addDay());
        return[
         'user'=>$user,
         'token'=>$token->plainTextToken
        ];

    }
    public function logout(Request $request){
        $request->user()->tokens()->delete();
        return[
          'message'=>'Logged out successfully'
        ];
    }
}
```

## Sunucu Çalıştırma

```bash
php artisan serve
```
