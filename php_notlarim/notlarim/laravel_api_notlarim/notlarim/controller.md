# Controller Adımları

Api controller Oluşturma:

```bash
php artisan make:controller API/BlogController --api
```

- `--api` parametresi, controller'ın API için gerekli metotları otomatik olarak oluşturmasını sağlar.

**Dosya:** `app/Http/Controllers/BlogController.php`

<details>
<summary><b>BlogController.php</b></summary>

```php
use App\Models\Blog;

     public function index()
    {

        return Blog::all();
    }
    public function store(Request $request)
    {
        $blog = Blog::create($request->all());
        return $blog;
    }
    public function show(Blog $blog)
    {
        return $blog;
    }
    public function update(Request $request, Blog $blog)
    {
        $blog->update($request->all());
        return $blog;
    }

    public function destroy(Blog $blog)
    {

        $blog->delete();
        return ["message" => "Blog silindi"];
    }
```

</details>
