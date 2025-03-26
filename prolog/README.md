
# Prolog Calculator

## Özellikler
- **Değişkenler**: Kullanıcılar değişkenlere değer atayabilir.
- **Aritmetik İşlemler**: Toplama, çıkarma, çarpma ve bölme işlemleri yapılabilir.
- **Hata Yönetimi**: Bölme işlemi sırasında sıfıra bölme hatası ele alınmaktadır.
- **Dinamik Değişkenler**: Kullanıcılar değişkenleri atayabilir ve daha sonra bunları kullanabilir.
- **Çıkış Komutu**: Kullanıcılar `"exit"` yazarak hesap makinesinden çıkabilir.

## Gereksinimler
Prolog çalıştırmak için bir SWI-Prolog ortamına ihtiyacınız vardır.

## Kullanım
1. `calculator.pl` dosyasını bir Prolog ortamında swipl kotuyula açın.
2. Açılan terminalde aşağıdaki komutu çalıştırarak hesap makinesini başlatın:
   [calculator].
3. Aritmetik ifadeler veya değişken atamaları girerek hesaplamalarınızı yapabilirsiniz.
4. Çıkış yapmak için `"exit"` yazabilirsiniz.

Hata Yönetimi
1. Geçersiz Girişler: Tanınmayan veya yanlış yazılmış ifadeler için hata mesajı verilir.
2. Bölme Hatası: Sıfıra bölme işlemi yapılırsa program uygun bir hata mesajı görüntüler.
