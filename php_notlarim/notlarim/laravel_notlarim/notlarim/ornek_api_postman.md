## Laravel Uygulama API'si Postman Koleksiyonu Analizi

Bu koleksiyon, bir blog veya benzeri bir içerik yönetim sistemi için temel CRUD (Oluşturma, Okuma, Güncelleme, Silme) işlemlerini ve kullanıcı kimlik doğrulamasını kapsayan API uç noktalarını içermektedir.

### Temel Bilgiler

- **Host (Ana Bilgisayar):** Tüm istekler `http://127.0.0.1:8000` adresine yapılmaktadır. Bu genellikle yerel geliştirme ortamınızı temsil eder.
- **Accept Header:** Çoğu istekte `Accept: application/json` başlığı bulunmaktadır. Bu, API'den JSON formatında yanıt beklendiğini belirtir.
- **Content-Type Header:** `POST` ve `PUT` isteklerinde `Content-Type: application/json` başlığı bulunmaktadır. Bu, isteğin gövdesinin JSON formatında olduğunu belirtir.
- **Bearer Token:** Kullanıcı kimlik doğrulaması gerektiren isteklerde, `Authorization` başlığı altında `Bearer Token` kullanılmaktadır. Bu token, başarılı bir giriş (login) işleminden sonra elde edilir ve kullanıcının yetkilendirildiğini doğrular.

### İsteklerin Detaylı Açıklaması

Aşağıda, koleksiyonda bulunan her bir isteğin amacı ve nasıl kullanılacağı açıklanmaktadır:

#### 1\. List 1 post (Tek Bir Gönderiyi Listele)

- **Amaç:** Belirli bir gönderinin detaylarını almak için kullanılır.
- **Metod:** `GET`
- **URL:** `http://127.0.0.1:8000/api/posts/1`
  - `1` değeri, almak istediğiniz gönderinin kimliğini (ID) temsil eder. Bu değeri istediğiniz gönderinin ID'si ile değiştirmelisiniz.
- **Nasıl Kullanılır:** Bu isteği gönderdiğinizde, Postman size ID'si 3 olan gönderinin bilgilerini (başlık, içerik vb.) JSON formatında döndürecektir.

#### 2\. Create post (Gönderi Oluştur)

- **Amaç:** Yeni bir gönderi oluşturmak için kullanılır.
- **Metod:** `POST`
- **URL:** `http://127.0.0.1:8000/api/posts`
- **Body (Gövde):**
  ```json
  {
    "title": "Post 1",
    "body": "This is post 1 body."
  }
  ```
  - `title`: Oluşturmak istediğiniz gönderinin başlığı.
  - `body`: Oluşturmak istediğiniz gönderinin içeriği.
- **Nasıl Kullanılır:** Bu isteği gönderdiğinizde, Postman belirtilen başlık ve içerikle yeni bir gönderi oluşturmaya çalışacak ve genellikle yeni gönderinin detaylarını veya bir başarı mesajını döndürecektir.

#### 3\. Update post (Gönderiyi Güncelle)

- **Amaç:** Mevcut bir gönderiyi güncellemek için kullanılır. Bu istek genellikle kimlik doğrulaması gerektirmez, yani herkes bir gönderiyi güncelleyebilir.
- **Metod:** `PUT`
- **URL:** `http://127.0.0.1:8000/api/posts/1`
  - `1` değeri, güncellemek istediğiniz gönderinin kimliğini (ID) temsil eder. Bu değeri güncellemek istediğiniz gönderinin ID'si ile değiştirmelisiniz.
- **Body (Gövde):**
  ```json
  {
    "title": "Post 1 updated",
    "body": "This is post 1 body."
  }
  ```
  - `title`: Gönderinin yeni başlığı.
  - `body`: Gönderinin yeni içeriği.
- **Nasıl Kullanılır:** Bu isteği gönderdiğinizde, Postman ID'si 1 olan gönderinin başlığını "Post 1 updated" olarak güncelleyecektir.

#### 4\. User update post (Kullanıcı Tarafından Gönderiyi Güncelle)

- **Amaç:** Kimlik doğrulaması yapılmış bir kullanıcının kendi gönderilerini güncellemesi için kullanılır. Bu istek bir `Bearer Token` gerektirir.
- **Metod:** `PUT`
- **URL:** `http://127.0.0.1:8000/api/posts/1`
  - `1` değeri, güncellemek istediğiniz gönderinin kimliğini (ID) temsil eder. Bu değeri, kullanıcının sahip olduğu gönderinin ID'si ile değiştirmelisiniz.
- **Authorization (Kimlik Doğrulama):**
  - `Type`: `Bearer Token`
  - `Token`: `3|82yzbVLfGkpAdlqvD5foytnSNXd3XNaUmX1weySu2825e65d`
    - Bu token değeri geçicidir ve gerçek bir oturum açma işleminden sonra elde edilen geçerli bir token ile değiştirilmelidir.
- **Body (Gövde):**
  ```json
  {
    "title": "Post 1 updated",
    "body": "This is post 1 body."
  }
  ```
  - `title`: Gönderinin yeni başlığı.
  - `body`: Gönderinin yeni içeriği.
- **Nasıl Kullanılır:** Öncelikle `Login user` isteğini kullanarak bir token almanız gerekir. Aldığınız token'ı bu isteğin `Authorization` sekmesindeki `Bearer Token` alanına yapıştırın. Ardından isteği göndererek belirtilen ID'ye sahip gönderiyi güncelleyebilirsiniz, ancak bu gönderinin token ile ilişkili kullanıcıya ait olması gerekir.

#### 5\. Delete post (Gönderiyi Sil)

- **Amaç:** Mevcut bir gönderiyi silmek için kullanılır. Bu istek genellikle kimlik doğrulaması gerektirmez, yani herkes bir gönderiyi silebilir.
- **Metod:** `DELETE`
- **URL:** `http://127.0.0.1:8000/api/posts/3`
  - `3` değeri, silmek istediğiniz gönderinin kimliğini (ID) temsil eder. Bu değeri silmek istediğiniz gönderinin ID'si ile değiştirmelisiniz.
- **Nasıl Kullanılır:** Bu isteği gönderdiğinizde, Postman ID'si 3 olan gönderiyi silmeye çalışacaktır.

#### 6\. User delete post (Kullanıcı Tarafından Gönderiyi Sil)

- **Amaç:** Kimlik doğrulaması yapılmış bir kullanıcının kendi gönderilerini silmesi için kullanılır. Bu istek bir `Bearer Token` gerektirir.
- **Metod:** `DELETE`
- **URL:** `http://127.0.0.1:8000/api/posts/1`
  - `1` değeri, silmek istediğiniz gönderinin kimliğini (ID) temsil eder. Bu değeri, kullanıcının sahip olduğu gönderinin ID'si ile değiştirmelisiniz.
- **Authorization (Kimlik Doğrulama):**
  - `Type`: `Bearer Token`
  - `Token`: `1|sdwKL6EgRhTVuxymuhmZKBG4AX7Do9JwHLzLeGNDf4e06c89`
    - Bu token değeri geçicidir ve gerçek bir oturum açma işleminden sonra elde edilen geçerli bir token ile değiştirilmelidir.
- **Nasıl Kullanılır:** Öncelikle `Login user` isteğini kullanarak bir token almanız gerekir. Aldığınız token'ı bu isteğin `Authorization` sekmesindeki `Bearer Token` alanına yapıştırın. Ardından isteği göndererek belirtilen ID'ye sahip gönderiyi silebilirsiniz, ancak bu gönderinin token ile ilişkili kullanıcıya ait olması gerekir.

#### 7\. Register user (Kullanıcı Kaydet)

- **Amaç:** Yeni bir kullanıcı hesabı oluşturmak için kullanılır.
- **Metod:** `POST`
- **URL:** `http://127.0.0.1:8000/api/register`
- **Body (Gövde):**
  ```json
  {
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "password": "123",
    "password_confirmation": "123"
  }
  ```
  - `name`: Kullanıcının adı.
  - `email`: Kullanıcının e-posta adresi (benzersiz olmalıdır).
  - `password`: Kullanıcının parolası.
  - `password_confirmation`: Parolanın tekrarı (parola ile aynı olmalıdır).
- **Nasıl Kullanılır:** Bu isteği gönderdiğinizde, belirtilen bilgilerle yeni bir kullanıcı hesabı oluşturulacaktır. Başarılı olması durumunda genellikle kullanıcı bilgileri ve bir erişim tokenı döndürülür.

#### 8\. Login user (Kullanıcı Girişi Yap)

- **Amaç:** Mevcut bir kullanıcının sisteme giriş yapmasını sağlamak ve bir erişim tokenı almak için kullanılır.
- **Metod:** `POST`
- **URL:** `http://127.0.0.1:8000/api/login`
- **Body (Gövde):**
  ```json
  {
    "email": "kaan@gmail.com",
    "password": "123"
  }
  ```
  - `email`: Kayıtlı kullanıcının e-posta adresi.
  - `password`: Kullanıcının parolası.
- **Nasıl Kullanılır:** Bu isteği gönderdiğinizde, eğer e-posta ve parola doğruysa, API bir `Bearer Token` döndürecektir. Bu token, `User update post`, `User delete post` ve `Logout user` gibi kimlik doğrulama gerektiren diğer isteklere kopyalanmalıdır.

#### 9\. Logout user (Kullanıcı Çıkışı Yap)

- **Amaç:** Kimlik doğrulaması yapılmış bir kullanıcının oturumunu sonlandırmak ve erişim tokenını geçersiz kılmak için kullanılır.
- **Metod:** `POST`
- **URL:** `http://127.0.0.1:8000/api/logout`
- **Authorization (Kimlik Doğrulama):**
  - `Type`: `Bearer Token`
  - `Token`: `1|E3Ho3HGXOoUJ94ymZ9I0NxZySvpif1pY07NbMwfLb4e59b8d`
    - Bu token değeri, oturumu sonlandırmak istediğiniz kullanıcının geçerli tokenı olmalıdır.
- **Nasıl Kullanılır:** `Login user` isteği ile aldığınız token'ı bu isteğin `Authorization` sekmesindeki `Bearer Token` alanına yapıştırın. İsteği gönderdiğinizde, o token ile ilişkilendirilmiş oturum sonlandırılacaktır.

#### 10\. User create post (Kullanıcı Tarafından Gönderi Oluştur)

- **Amaç:** Kimlik doğrulaması yapılmış bir kullanıcının yeni bir gönderi oluşturması için kullanılır. Bu istek bir `Bearer Token` gerektirir.
- **Metod:** `POST`
- **URL:** `http://127.0.0.1:8000/api/posts`
- **Authorization (Kimlik Doğrulama):**
  - `Type`: `Bearer Token`
  - `Token`: `2|VplzyB9f0MZ33xcfGjnAH9aO00Hg2hV9ny09Li3ic13ccc97`
    - Bu token değeri geçicidir ve gerçek bir oturum açma işleminden sonra elde edilen geçerli bir token ile değiştirilmelidir.
- **Body (Gövde):**
  ```json
  {
    "title": "Post 1",
    "body": "This is post 1 body."
  }
  ```
  - `title`: Oluşturmak istediğiniz gönderinin başlığı.
  - `body`: Oluşturmak istediğiniz gönderinin içeriği.
- **Nasıl Kullanılır:** `Login user` isteğini kullanarak bir token aldıktan sonra, bu token'ı isteğin `Authorization` sekmesine yapıştırın. Ardından gönderi başlığını ve içeriğini belirterek isteği gönderin. Bu, token ile ilişkili kullanıcı adına bir gönderi oluşturacaktır.

#### 11\. User info (Kullanıcı Bilgileri)

- **Amaç:** Kimlik doğrulaması yapılmış kullanıcının bilgilerini (örneğin adı, e-postası) almak için kullanılır. Bu istek bir `Bearer Token` gerektirir.
- **Metod:** `GET`
- **URL:** `http://127.0.0.1:8000/api/user`
- **Authorization (Kimlik Doğrulama):**
  - `Type`: `Bearer Token`
  - `Token`: `1|sdwKL6EgRhTVuxymuhmZKBG4AX7Do9JwHLzLeGNDf4e06c89`
    - Bu token değeri, bilgilerini almak istediğiniz kullanıcının geçerli tokenı olmalıdır.
- **Nasıl Kullanılır:** `Login user` isteği ile aldığınız token'ı bu isteğin `Authorization` sekmesindeki `Bearer Token` alanına yapıştırın. İsteği gönderdiğinizde, o token ile ilişkili kullanıcının bilgileri JSON formatında döndürülecektir.
