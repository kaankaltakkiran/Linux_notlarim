# Controller Adımları

**Dosya:** `app/Http/Controllers/NoteController.php`

```php
use Illuminate\Http\Request;

    public function index()
    {

        return Note::all();
    }
    public function store(Request $request)
    {
        $note = Note::create($request->all());
        return $note;
    }
    public function show(Note $note)
    {
        return $note;
    }
    public function update(Request $request, Note $note)
    {
        $note->update($request->all());
        return $note;
    }

    public function destroy(Note $note)
    {

        $note->delete();
        return ["message" => "Not silindi"];
    }
```
