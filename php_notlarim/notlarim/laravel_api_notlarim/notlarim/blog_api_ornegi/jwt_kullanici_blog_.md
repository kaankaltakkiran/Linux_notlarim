# Laravel JWT İle Kullanıcı Blog İşlemleri

Bu rehber,daha önceden oluşturulan laravel api örneğinin devamı şeklindedir. Bu notta sadece eklenecek kısımlar ve değişiklikler yer alacaktır. [Önceki notları](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/php_notlarim/notlarim/laravel_api_notlarim/notlarim/blog_api_ornegi/blog_api_rehberi.md) incelemenizi öneririm.

## Model Ve Migration Konfigürasyon

**Dosya:** `app/Models/Blog.php`

<details>
<summary><b>Blog.php</b></summary>

```php
  public function user(){
        return $this->belongsTo(User::class);
    }
```

</details>

**Dosya:** `app/Models/User.php`

<details>
<summary><b>User.php</b></summary>

```php
   public function blogs(){
        return $this->hasMany(Blog::class);
    }
```

</details>

**Dosya:** `database/migrations/2023_10_01_000000_create_blogs_table.php`

<details>
<summary><b>create_blogs_table</b></summary>

```php
   Schema::create('blogs', function (Blueprint $table) {
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
        });
```

</details>

> ** Note:** Migration dosyasını düzenledikten sonra, veritabanında değişiklikleri uygulamak için aşağıdaki komutu çalıştırın:

```bash
php artisan migrate:fresh
```

## Policy Konfigürasyon

Policy oluşturma:

```bash
php artisan make:policy BlogPolicy --model=Blog
```

**Dosya:** `app/Policies/BlogPolicy.php`

<details>
<summary><b>BlogPolicy.php</b></summary>

```php
public function modify(User $user, Blog $blog): Response
{
return $user->id === $blog->user_id
? Response::allow()
: Response::deny('Bu blogu düzenleme izniniz yok.');
}
```

</details>

**Dosya:** `app/Providers/AuthServiceProvider.php`

<details>
<summary><b>AuthServiceProvider.php</b></summary>

```php
use App\Models\Blog;
use App\Policies\BlogPolicy;

protected $policies = [
    Blog::class => BlogPolicy::class,
];

```

## Controller Konfigürasyon

**Dosya:** `app/Http/Controllers/API/BlogController.php`

<details>
<summary><b>BlogController</b></summary>

```php
use Illuminate\Support\Facades\Gate;

     public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['index', 'show']]);
    }

    public function index()
    {

       return Blog::with('user')->latest()->get();
    }
    public function store(Request $request)
    {

       $blog = $request->user()->blogs()->create($request->all());
        return response()->json([
            'message' => 'Blog başarıyla kaydedildi',
            'blog' => $blog,
            'user' => $blog->user,
        ]);
    }
    public function show(Blog $blog)
    {
           return response()->json([
            'blog' => $blog,
            'user' => $blog->user,
        ]);
    }
    public function update(Request $request, Blog $blog)
    {
        Gate::authorize('modify', $blog);

        $blog->update($request->all());
        return response()->json([
            'blog' => $blog,
            'message' => 'Blog güncellendi',
        ]);
    }

    public function destroy(Blog $blog)
    {
        Gate::authorize('modify', $blog);

        $blog->delete();
        return response()->json([
            'message' => 'Blog silindi',
        ]);
    }
```

</details>
