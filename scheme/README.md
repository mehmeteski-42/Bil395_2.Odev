# Racket Calculator

## Özellikler
- **Değişkenler:** Kullanıcı değişkenlere değer atayabilir ve bunları kullanabilir.
- **Aritmetik İşlemler:** Toplama, çıkarma, çarpma ve bölme işlemleri desteklenir.
- **Parantezli İfadeler:** Kullanıcı iç içe geçmiş parantezli matematiksel ifadeler yazabilir.
- **Hata Yönetimi:**  
  - Sıfıra bölme hatası yakalanır ve uygun bir hata mesajı gösterilir.  
  - Tanımlanmamış değişkenlere erişmeye çalışıldığında hata verilir.
- **Testler:** Çeşitli testler terminalde çalıştırılır ve doğrulukları kontrol edilir.

## Gereksinimler
- **Racket** programlama dili kurulu olmalıdır.

## Kurulum
1. **Racket’i indirin ve yükleyin.**
2. calculator.rkt dosyasını Racket ortamında açın ve runlayın

## Çalıştırma
Racket ortamında veya terminalde aşağıdaki komutları kullanarak çalıştırabilirsiniz:

```sh
racket calculator.rkt
```
veya  
```sh
gracket calculator.rkt
```

## Kullanım
Aşağıda bazı örnek kullanım senaryoları verilmiştir:

### **Değişken Atama**
```scheme
(calculator-eval '(= x 10))  ; x değişkenine 10 değerini ata
```
### **Toplama**
```scheme
(calculator-eval '(+ 2 3))   ; 2 + 3 işlemini hesapla
```
### **Çıkarma**
```scheme
(calculator-eval '(- 5 2))   ; 5 - 2 işlemini hesapla
```
### **Çarpma**
```scheme
(calculator-eval '(* 4 3))   ; 4 * 3 işlemini hesapla
```
### **Bölme**
```scheme
(calculator-eval '(/ 10 2))  ; 10 / 2 işlemini hesapla
```
### **Sıfıra Bölme Hatası Yönetimi**
```scheme
(calculator-eval '(/ 10 0))  ; Hata mesajı döndürür
```
### **Parantezli İfade Kullanımı**
```scheme
(calculator-eval '(+ (* 2 3) (- 5 1)))  ; (2 * 3) + (5 - 1) işlemini hesapla
```
### **Değişken Kullanımı**
```scheme
(calculator-eval 'x)  ; x değişkeninin değerini göster
```
```scheme
(calculator-eval '(+ x 5))  ; x + 5 işlemini yap
```

## Testler
Projede çeşitli testler bulunmaktadır. Aşağıdaki testler `calculator.rkt` çalıştırıldığında otomatik olarak gerçekleştirilir:
- **Toplama, çıkarma, çarpma ve bölme testleri**  
- **Değişken atama ve erişim testleri**  
- **Parantezli ifadelerle işlem yapma testleri**  
- **Sıfıra bölme hatası testi**  

Testlerin çıktıları terminalde görüntülenir.
