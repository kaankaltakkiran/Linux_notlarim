# Laravel API Oluşturma Rehberi

Aşağıdaki adımları takip ederek, Laravel ile basit bir CRUD API (kullanıcı + post işlemleri) oluşturabilirsiniz.

- **1. Adım:** <a href="#laravel-kurulum">Laravel Kurulum</a>
- **2. Adım:** <a href="#laravel-proje-oluşturma">Laravel Proje Oluşturma</a>
- **3. Adım:** <a href="#çalıştırılacak-php-artisan-komutları">Çalıştırılacak Php Artisan Komutları</a>
- **4. Adım:** <a href="#user-konfigürasyon">User Konfigürasyon</a>
- **5. Adım:** <a href="#post-konfigürasyon">Post Konfigürasyon</a>
- **6. Adım:** <a href="#router-konfigürasyon">Router Konfigürasyon</a>
- **7. Adım:** <a href="#sunucuyu-çalıştırma">Sunucuyu Çalıştırma</a>

---

## Laravel Kurulum

Daha öncesinde bilgisayarınızda `PHP ve Composer kurulu değilse` aşağıdaki komutları kullanarak kurulum yapabilirsiniz:

<details>
<summary><b>macOS</b></summary>

```bash
/bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.4)"
```

</details>

<details>
<summary><b>Windows PowerShell</b></summary>

```bash
# Run as administrator...
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.4'))
```

</details>

<details>
<summary><b>Linux</b></summary>

```bash
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"
```

</details>

Eğer bilgisayarınızda `PHP ve Composer` kurulu ise, aşağıdaki komutları kullanarak Laravel yükleyicisi kurabilirsiniz:

```bash
composer global require laravel/installer
```

### Kurulum Sonrası Kontrol

Laravel kurulumunun başarılı olup olmadığını kontrol etmek için terminalde aşağıdaki komutu çalıştırabilirsiniz:

```bash
laravel --version
```

## Laravel Proje Oluşturma

Laravel projesi oluşturmak için terminalde aşağıdaki komutları kullanabilirsiniz:

```bash
laravel new post-api
cd post-api
```

- Başlangıç kitini **None** seçin.
- Veritabanı olarak **MySQL** seçin.
- Migration’ları hemen çalıştırmak için **yes** deyin.
- `npm install` ve `npm run dev` için **yes** deyin.

---

### `.env` Dosyasını Düzenleme

`/.env` dosyanıza `DB_USERNAME` ve `DB_PASSWORD` bilgilerinizi ekleyin:

```dotenv
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_todo_api
DB_USERNAME=KULLANICI_ADINIZ
DB_PASSWORD=ŞİFRENİZ
```

---

## Çalıştırılacak Php Artisan Komutları

### Sanctum Api Kurulum

```bash
php artisan install:api
```

- Yeni migration’lar sorulunca **enter** (yes) deyin.
- Veritabanı yoksa komut sonrası **yes** ile oluşturun.

### Post Model Controller Oluşturma

```bash
php artisan make:model Post -a --api
```

- `-a` = migration, factory, controller,policy dosyalarını otomatik oluşturur.
- `--api` = yalnızca API metodları oluşturur.

```bash
php artisan migrate
```

### Auth Controller Oluşturma

```bash
php artisan make:controller AuthController
```

---

## User Konfigürasyon

### Auth Controller Düzenleme

**Dosya:** `app/Http/Controllers/AuthController.php`

```php
use App\Models\User;
use Illuminate\Support\Facades\Hash;

  public function register(Request $request)
    {
        $fields = $request->validate([
            'name'     => 'required|max:255',
            'email'    => 'required|email|unique:users',
            'password' => 'required|confirmed',
        ]);

        $user  = User::create($fields);
        $token=$user->createToken($request->name);
        return ['user' => $user, 'token' => $token->plainTextToken];
    }

    public function login(Request $request)
    {
        $fields = $request->validate([
            'email'    => 'required|email|exists:users',
            'password' => 'required',
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
       $token=$user->createToken($user->name);
        return ['user' => $user, 'token' => $token->plainTextToken];
    }
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return ['message' => 'Logged out successfully'];
    }
```

### Sanctum Api Konfigürasyon

**Dosya:** `app/Models/User.php`

```php
   use Laravel\Sanctum\HasApiTokens;
   use HasFactory, Notifiable,HasApiTokens;

       public function posts(){
        return $this->hasMany(Post::class);
    }

```

## Post Konfigürasyon

**Dosya:** `app/Models/Post.php`

```php
protected $fillable = [
        'title',
        'body',
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
```

---

### `posts` Tablosu Migration’ını Düzenleme

**Dosya:** `database/migrations/xxxx_xx_xx_create_posts_table.php`

```php
 Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->string('title');
            $table->text('body');
            $table->timestamps();

        });
```

- Değişiklikleri uygulamak için:

  ```bash
  php artisan migrate:fresh
  ```

---

### PostController Düzenleme

**Dosya:** `app/Http/Controllers/PostController.php`

```php
use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Gate;

class PostController extends Controller implements HasMiddleware

  public static function middleware()
    {
       return [ new Middleware('auth:sanctum',except:['index','show'])];
    }

    public function index()
    {

         return Post::with('user')->latest()->get();
    }

    public function store(Request $request)
    {

        $fields=$request->validate([
            'title' => ['required', 'max:255'],
            'body' => 'required',
        ]);
        $post=$request->user()->posts()->create($fields);
        return [
            'post'=>$post,
            'user'=>$post->user,
        ];
    }
    public function show(Post $post)
    {
            return [
            'post'=>$post,
            'user'=>$post->user,
        ];
    }
    public function update(Request $request, Post $post)
    {
         Gate::authorize('modify', $post);
        $fields=$request->validate([
            'title' => ['required', 'max:255'],
            'body' => 'required',
        ]);
        $post->update($fields);
        return $post;
    }
/
    public function destroy(Post $post)
    {
        Gate::authorize('modify',$post);
        $post->delete();
        return ['message'=>'Post deleted successfully.'];
    }
```

---

### PostPolicy Düzenleme

**Dosya:** `app/Policies/PostPolicy.php`

```php
    public function modify(User $user, Post $post)
    {
        return $user->id === $post->user_id
            ? Response::allow()
            : Response::deny('You do not own this post');
    }
```

## Router Konfigürasyon

**Dosya:** `routes/api.php`

```php
use App\Http\Controllers\PostController;
use App\Http\Controllers\AuthController;

Route::apiResource('posts',PostController::class);
Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);
Route::post('/logout',[AuthController::class,'logout'])->middleware('auth:sanctum');
```

- `php artisan route:list` ile kontrol edin.

---

## Sunucuyu Çalıştırma

```bash
php artisan serve
```

- API’niz şimdi `http://127.0.0.1:8000/api/...` adresinde çalışıyor.
- Postman veya başka bir araçla `register`, `login`, `posts` uç noktalarını test edin.

---
