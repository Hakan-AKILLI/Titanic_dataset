# Kaynak
Bu proje, Titanic yolcu verileri üzerinde yapılan analizlere dayanmaktadır. Kullanılan veri seti ve sorgular, Titanic yolcu bilgilerini içerir ve farklı SQL sorguları aracılığıyla analiz edilmiştir.

# Titanic Yolcu Verisi: SQL Sorgu Projesi

Bu proje, Titanic gemisinin yolcu verileriyle çalışmak ve farklı sorgular yazarak anlamlı bilgiler elde etmek için hazırlanmıştır. Aşağıda projenin sorguları ve açıklamaları yer almaktadır.

## Sorgular ve Açıklamaları

### 1. Hayatta Kalan Yolcuları Bulan Sorgu
```sql
SELECT *
FROM passengers
WHERE Survived = 1;
```
Bu sorgu, Titanic kazasından sağ kurtulan tüm yolcuların bilgilerini listelemektedir.

---

### 2. Cinsiyeti Kadın Olan Yolcuları Bulan Sorgu
```sql
SELECT *
FROM passengers
WHERE Sex = 'female';
```
Bu sorgu, sadece kadın yolcuların bilgilerini getirmektedir.

---

### 3. Hayatını Kaybeden Yolcuların Sayısını Bulan Sorgu
```sql
SELECT COUNT(*) AS Olen_Yolcu_Sayisi
FROM passengers
WHERE Survived = 0;
```
Bu sorgu, Titanic kazasında hayatını kaybeden yolcuların toplam sayısını hesaplamaktadır.

---

### 4. Hangi Limanda Kaç Yolcu Bindiğini Bulan Sorgu
```sql
SELECT Embarked, COUNT(*) AS Yolcu_Sayisi
FROM passengers
GROUP BY Embarked;
```
Bu sorgu, yolcuların hangi limandan bindiklerini ve her limandan kaç yolcu bindiğini göstermektedir.

---

### 5. Hangi Kabinde Kaç Yolcu Olduğunu Bulan Sorgu
```sql
SELECT Cabin, COUNT(*) AS Yolcu_Sayisi
FROM passengers
GROUP BY Cabin
ORDER BY Yolcu_Sayisi DESC;
```
Bu sorgu, her kabindeki yolcu sayısını listelemekte ve en çok yolcu bulunan kabinleri sıralamaktadır.

---

### 6. En Yaşlı Yolcunun Bilgilerini Gösteren Sorgu
```sql
SELECT *
FROM passengers
WHERE Age = (SELECT MAX(Age) FROM passengers);
```
Bu sorgu, Titanic gemisindeki en yaşlı yolcunun bilgilerini getirmektedir.

---

### 7. Cinsiyet ve Sınıf Bazında Hayatta Kalma Oranı
```sql
SELECT Sex, Pclass,
       SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS Hayatta_Kalanlar,
       COUNT(*) AS Toplam_Yolcu,
       (SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Hayatta_Kalma_Orani
FROM passengers
GROUP BY Sex, Pclass;
```
Bu sorgu, yolcuların cinsiyet ve sınıf bazında hayatta kalma oranlarını hesaplamaktadır.

---

### 8. Yolcuların Yaş Kategorilerini Gösteren Sorgu
```sql
SELECT
    CASE
        WHEN Age BETWEEN 0 AND 18 THEN 'Cocuk'
        WHEN Age BETWEEN 19 AND 30 THEN 'Genc_Yetiskin'
        WHEN Age BETWEEN 31 AND 59 THEN 'Orta_Yasli'
        ELSE 'Yasli'
    END AS YasGrubu,
    COUNT(*) AS YolcuSayisi
FROM
    passengers
GROUP BY
    YasGrubu;
```
Bu sorgu, yolcuları yaş gruplarına ayırmakta ve her yaş grubundaki yolcu sayısını göstermektedir.

---

### 9. Yolcuların Yaş Dağılımını Bulan Sorgu
```sql
SELECT
    Age,
    COUNT(*) AS YolcuSayisi
FROM
    passengers
GROUP BY
    Age
ORDER BY
    Age;
```
Bu sorgu, yolcuların yaşlarına göre dağılımını sıralı bir şekilde göstermektedir.

---

## Proje Hedefi
Bu proje, Titanic yolcu veri setini kullanarak farklı analizler yapmak, hayatta kalma oranları, yaş grupları ve yolcuların diğer özelliklerini incelemek amacıyla geliştirilmiştir. Her sorgu, belirli bir analitik ihtiyacı karşılamak üzere tasarlanmıştır.

