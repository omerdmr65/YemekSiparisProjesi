-- YEMEK SIPARIS SISTEMI - QUERIES, VIEWS, TRIGGERS VE INDEXES

USE YemekSiparisDB
GO

-- JOIN SORGUSU

SELECT
    s.SiparisID,
    m.Ad + ' ' + m.Soyad AS Musteri,
    r.RestoranAdi,
    u.UrunAdi,
    sd.Adet,
    sd.BirimFiyat,
    s.ToplamTutar,
    s.SiparisDurumu
FROM Siparis s
INNER JOIN Musteri m ON s.MusteriID = m.MusteriID
INNER JOIN Restoran r ON s.RestoranID = r.RestoranID
INNER JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
INNER JOIN Urun u ON sd.UrunID = u.UrunID
GO

-- GROUP BY HAVING SORGUSU

SELECT
    r.RestoranAdi,
    COUNT(s.SiparisID) AS SiparisSayisi,
    AVG(s.ToplamTutar) AS OrtalamaSiparisTutari
FROM Siparis s
INNER JOIN Restoran r ON s.RestoranID = r.RestoranID
GROUP BY r.RestoranAdi
HAVING COUNT(s.SiparisID) > 2
GO

-- SUBQUERY SORGUSU

SELECT
    MusteriID,
    Ad,
    Soyad
FROM Musteri
WHERE MusteriID NOT IN
(
    SELECT BagisYapanMusteriID
    FROM AskidaBagis
)
GO

-- LEFT JOIN SORGUSU

SELECT
    m.MusteriID,
    m.Ad,
    m.Soyad,
    s.SiparisID
FROM Musteri m
LEFT JOIN Siparis s ON m.MusteriID = s.MusteriID
WHERE s.SiparisID IS NULL
GO

-- AKTIF RESTORAN MENULERI VIEW

CREATE OR ALTER VIEW vw_AktifRestoranMenuleri
AS
SELECT
    r.RestoranAdi,
    k.KategoriAdi,
    u.UrunAdi,
    u.Fiyat
FROM Urun u
INNER JOIN Restoran r ON u.RestoranID = r.RestoranID
INNER JOIN Kategori k ON u.KategoriID = k.KategoriID
WHERE u.IsActive = 1
GO

-- ASKIDA YEMEK HAVUZU VIEW

CREATE OR ALTER VIEW vw_AskidaYemekHavuzu
AS
SELECT
    COUNT(BagisID) AS ToplamBagisSayisi,
    SUM(BagisTutari) AS ToplamBagisTutari
FROM AskidaBagis
WHERE IsActive = 1
GO

-- SIPARIS TOPLAMINI GUNCELLEYEN TRIGGER

CREATE OR ALTER TRIGGER trg_SiparisToplamGuncelle
ON SiparisDetay
AFTER INSERT
AS
BEGIN
    UPDATE s
    SET s.ToplamTutar =
    (
        SELECT SUM(sd.Adet * sd.BirimFiyat)
        FROM SiparisDetay sd
        WHERE sd.SiparisID = s.SiparisID
    )
    FROM Siparis s
    INNER JOIN inserted i ON s.SiparisID = i.SiparisID
END
GO

-- ASKIDA KULLANIM SONRASI BAGIS GUNCELLEYEN TRIGGER

CREATE OR ALTER TRIGGER trg_AskidaBagisGuncelle
ON AskidaKullanim
AFTER INSERT
AS
BEGIN
    UPDATE AskidaBagis
    SET IsActive = 0
    WHERE BagisID IN
    (
        SELECT TOP 1 BagisID
        FROM AskidaBagis
        WHERE IsActive = 1
        ORDER BY BagisTarihi
    )
END
GO

-- MUSTERI EMAIL INDEX

IF NOT EXISTS (
    SELECT 1
    FROM sys.stats
    WHERE name = 'IX_Musteri_Email_Proje'
    AND object_id = OBJECT_ID('dbo.Musteri')
)
BEGIN
    EXEC('CREATE INDEX IX_Musteri_Email_Proje ON dbo.Musteri(Email)')
END
GO

-- SIPARIS TARIH INDEX

IF NOT EXISTS (
    SELECT 1
    FROM sys.stats
    WHERE name = 'IX_Siparis_Tarih_Proje'
    AND object_id = OBJECT_ID('dbo.Siparis')
)
BEGIN
    EXEC('CREATE INDEX IX_Siparis_Tarih_Proje ON dbo.Siparis(SiparisTarihi)')
END
GO