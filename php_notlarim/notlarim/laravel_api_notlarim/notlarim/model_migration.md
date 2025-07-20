# Model Ve Migration Adımları

## Migration Oluşturma

```bash
php artisan make:migration create_blogs_table --create=blogs
```

- `create_blogs_table` = Migration dosyasının adı.
- `--create=blogs` = Migration dosyası, `blogs` adında bir tablo oluşturacak.

## Migration Düzenleme

**Dosya:** `database/migrations/xxxx_xx_xx_create_blogs_table.php`

```php
        Schema::create('blogs', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description');
            $table->boolean('is_published')->default(0); // 0: Yayınlanmadı, 1: Yayınlandı
            $table->timestamp('published_at')->nullable();
            $table->softDeletes(); // Soft Delete
            $table->timestamps();
        });
```

Tabloları oluşturmak için migration dosyasını çalıştırın:

```bash
php artisan migrate
```

## Model Düzenleme

Model dosyasını oluşturun:

```bash
php artisan make:model Blog
```

**Dosya:** `app/Models/Blog.php`

```php
use Illuminate\Database\Eloquent\SoftDeletes;

 use SoftDeletes;

protected $fillable = [
        'title',
        'description',
        'is_published',
    ];
```
