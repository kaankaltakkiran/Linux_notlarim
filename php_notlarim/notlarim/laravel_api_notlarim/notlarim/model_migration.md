# Model Ve Migration Adımları

## Model Oluşturma

```bash
 php artisan make:model Note -a --api
```

- `-a` = migration, factory, controller,policy dosyalarını otomatik oluşturur.
- `--api` = yalnızca API metodları oluşturur.

## Migration Düzenleme

**Dosya:** `database/migrations/xxxx_xx_xx_create_notes_table.php`

```php
        Schema::create('notes', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('content');
            $table->tinyInteger('status')->default(0);
            $table->timestamps();
        });
```

## Model Düzenleme

**Dosya:** `app/Models/Note.php`

```php
protected $fillable = [
        'title',
        'content',
    ];
```
Tabloları oluşturmak için migration dosyasını çalıştırın:
```bash
php artisan migrate
```
