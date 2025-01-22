--Hayatta kalan yolcuları bulan sorgu
SELECT *
FROM passengers
WHERE Survived = 1;


--cinsiyeti kadın olan yolcuları bulan sorgu
SELECT *
FROM passengers
WHERE Sex = 'female';


--Hayatının kaybetmiş yolcuların sayısı bulan sorgu
SELECT COUNT(*) AS Olen_Yolcu_Sayisi
FROM passengers
WHERE Survived = 0;


--Hangi limanda kaç yolcu bindiğini bulan sorgu
SELECT Embarked, COUNT(*) AS Yolcu_Sayisi
FROM passengers
GROUP BY Embarked;


--Hangi kabinde kaç yolcu olduğunu bulan sorgu
SELECT Cabin, COUNT(*) AS Yolcu_Sayisi
FROM passengers
GROUP BY Cabin
ORDER BY Yolcu_Sayisi DESC;


--En yaşlı yolcunun bilgilerini gösteren sorgu
SELECT *
FROM passengers
WHERE Age = (SELECT MAX(Age) FROM passengers);


--Cinsiyet ve sınıf başına hayatta kalma oranı
SELECT Sex, Pclass,
       SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS Hayatta_Kalanlar,
       COUNT(*) AS Toplam_Yolcu,
       (SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Hayatta_Kalma_Orani
FROM passengers
GROUP BY Sex, Pclass;


--Yolcuların hangi yaş katagorisinde olduğunu gösteren sorgu
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


--Yolcuların yaş dağılımını bulan sorgu
SELECT
    Age,
    COUNT(*) AS YolcuSayisi
FROM
    passengers  -- Tablonuzun adı
GROUP BY
    Age
ORDER BY
    Age;