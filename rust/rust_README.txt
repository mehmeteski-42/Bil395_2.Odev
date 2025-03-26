# Rust Hesap Makinesi

Bu proje, Rust ile geliştirilmiş bir hesap makinesi uygulamasıdır. Ondalık sayılarla işlem yapabilir ve değişken atamalarını destekler.

## Kurulum ve Çalıştırma

1. **Rust'ı yükleyin** (Eğer yüklü değilse):  
   [Rust Yükleme](https://www.rust-lang.org/tools/install)

2. **Projeyi klonlayın veya oluşturun:**
   ```sh
   git clone <repo-link>
   cd <repo-klasörü>
   ```

3. **Projeyi çalıştırın:**
   ```sh
   cd hesap_makinesi/src
   cargo run
   ```

## Kullanım
- Matematiksel ifadeleri girerek hesaplama yapabilirsiniz:
  ```
  5 + 3 * 2
  ```
  Çıktı: `= 11`

- Değişken ataması yapabilirsiniz:
  ```
  x = 10
  ```
  Çıktı: `x = 10`

- Tanımlı değişkenleri işlemlerde kullanabilirsiniz:
  ```
  x + 5
  ```
  Çıktı: `= 15`

- Programdan çıkmak için `exit` yazabilirsiniz.

## Not
- Parantezli ifadeler desteklenir `(5 + 2) * 3`
- Hatalı girişler için hata mesajları görüntülenir.

