Özellikler
  Değişken Atama: Kullanıcılar a = 10 gibi ifadelerle değişkenlere değer atayabilir.
  Aritmetik İşlemler: Toplama (+), çıkarma (-), çarpma (*) ve bölme (/) desteklenir.
  Değişken Kullanımı: Atanan değişkenler doğrudan kullanılabilir (a + 5 gibi).
  Hata Yönetimi: Geçersiz ifadelerde hata mesajı görüntülenir.

Gereksinimler
  GNAT (GNU Ada Compiler) yüklü olmalıdır.

Derleme ve Çalıştırma
  Kodu derleyin:
    gnatmake calculator.adb
  Çalıştırın:
    ./simple_calculator
  
Hata Yönetimi
  Tanımsız Değişken Kullanımı: Eğer bir değişken atanmadıysa varsayılan değeri 0 olarak kabul edilir.
  Geçersiz İfade: Tanınmayan ifadelerde "Invalid expression" mesajı gösterilir.
  Bölme Hatası: Sıfıra bölme işlemleri engellenmiştir.
