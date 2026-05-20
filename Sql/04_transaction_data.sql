
USE YemekSiparisDB;
GO

INSERT INTO Siparis
(MusteriID, RestoranID, KuryeID, SiparisTarihi, SiparisDurumu, ToplamTutar, TeslimatAdresi)
VALUES

(1, 1, 1, GETDATE(), 'Teslim Edildi', 150, 'Ýstanbul'),
(2, 1, 2, GETDATE(), 'Hazýrlanýyor', 220, 'Ýstanbul'),
(3, 2, 3, GETDATE(), 'Teslim Edildi', 180, 'Ankara'),
(4, 2, 1, GETDATE(), 'Yolda', 260, 'Ankara'),
(5, 3, 2, GETDATE(), 'Teslim Edildi', 190, 'Bursa'),
(6, 3, 4, GETDATE(), 'Hazýrlanýyor', 140, 'Bursa'),
(7, 4, 5, GETDATE(), 'Teslim Edildi', 120, 'Ýzmir'),
(8, 4, 1, GETDATE(), 'Yolda', 210, 'Ýzmir'),
(9, 5, 2, GETDATE(), 'Teslim Edildi', 175, 'Antalya'),
(10, 5, 3, GETDATE(), 'Hazýrlanýyor', 160, 'Antalya'),

(11, 1, 4, GETDATE(), 'Teslim Edildi', 230, 'Ýstanbul'),
(12, 2, 5, GETDATE(), 'Teslim Edildi', 145, 'Ankara'),
(13, 3, 1, GETDATE(), 'Yolda', 280, 'Bursa'),
(14, 4, 2, GETDATE(), 'Hazýrlanýyor', 110, 'Ýzmir'),
(15, 5, 3, GETDATE(), 'Teslim Edildi', 205, 'Antalya'),
(16, 1, 4, GETDATE(), 'Teslim Edildi', 195, 'Ýstanbul'),
(17, 2, 5, GETDATE(), 'Yolda', 170, 'Ankara'),
(18, 3, 1, GETDATE(), 'Teslim Edildi', 240, 'Bursa'),
(19, 4, 2, GETDATE(), 'Hazýrlanýyor', 130, 'Ýzmir'),
(20, 5, 3, GETDATE(), 'Teslim Edildi', 260, 'Antalya');

INSERT INTO SiparisDetay
(SiparisID, UrunID, Adet, BirimFiyat)
VALUES

(2, 1, 1, 120),
(2, 7, 1, 30),

(3, 2, 2, 110),

(4, 11, 1, 150),
(4, 17, 1, 20),

(5, 12, 1, 140),
(5, 18, 2, 25),

(6, 21, 1, 130),
(6, 22, 1, 120),

(7, 23, 1, 135),

(8, 31, 1, 160),

(9, 32, 2, 90),

(10, 41, 1, 140),
(10, 47, 1, 35),

(11, 42, 1, 130),

(12, 3, 1, 140),
(12, 8, 1, 20),

(13, 13, 1, 150),

(14, 24, 2, 140),

(15, 33, 1, 80),

(16, 43, 1, 145),
(16, 48, 1, 30),

(17, 4, 1, 100),

(18, 14, 1, 140),

(19, 25, 1, 170),

(20, 34, 1, 70),

(21, 44, 1, 150),
(21, 49, 1, 40);


INSERT INTO Odeme
(SiparisID, OdemeTuru, OdemeTarihi, OdemeDurumu)
VALUES

(2, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(3, 'Nakit', GETDATE(), 'Baþarýlý'),
(4, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(5, 'Online Ödeme', GETDATE(), 'Baþarýlý'),
(6, 'Nakit', GETDATE(), 'Baþarýlý'),
(7, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(8, 'Online Ödeme', GETDATE(), 'Baþarýlý'),
(9, 'Nakit', GETDATE(), 'Baþarýlý'),
(10, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(11, 'Online Ödeme', GETDATE(), 'Baþarýlý'),

(12, 'Nakit', GETDATE(), 'Baþarýlý'),
(13, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(14, 'Online Ödeme', GETDATE(), 'Baþarýlý'),
(15, 'Nakit', GETDATE(), 'Baþarýlý'),
(16, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(17, 'Online Ödeme', GETDATE(), 'Baþarýlý'),
(18, 'Nakit', GETDATE(), 'Baþarýlý'),
(19, 'Kredi Kartý', GETDATE(), 'Baþarýlý'),
(20, 'Online Ödeme', GETDATE(), 'Baþarýlý'),
(21, 'Nakit', GETDATE(), 'Baþarýlý');

INSERT INTO AskidaBagis
(BagisYapanMusteriID, BagisTutari, BagisTarihi, AnonimMi, Aciklama, IsActive)
VALUES

(1, 300, GETDATE(), 0, '2 kiþilik askýda yemek baðýþý', 1),
(3, 180, GETDATE(), 1, 'Ýhtiyaç sahipleri için baðýþ', 1),
(5, 540, GETDATE(), 0, '3 kiþilik yemek desteði', 1),
(7, 240, GETDATE(), 1, 'Anonim baðýþ', 1),
(9, 175, GETDATE(), 0, 'Askýda yemek katkýsý', 1),

(11, 400, GETDATE(), 1, 'Destek baðýþý', 1),
(13, 280, GETDATE(), 0, 'Ýhtiyaç sahipleri için', 1),
(15, 410, GETDATE(), 1, 'Yemek desteði', 1),
(17, 170, GETDATE(), 0, 'Askýda yemek', 1),
(19, 260, GETDATE(), 1, 'Anonim destek', 1);

INSERT INTO AskidaKullanim
(MusteriID, SiparisID, KullanilanTutar, KullanimTarihi, Aciklama)
VALUES

(2, 3, 180, GETDATE(), 'Askýda yemek kullanýldý'),
(4, 5, 190, GETDATE(), 'Ýhtiyaç sahibi kullanýmý'),
(6, 7, 120, GETDATE(), 'Aský desteði kullanýldý'),
(8, 9, 175, GETDATE(), 'Ücretsiz sipariþ'),
(10, 11, 230, GETDATE(), 'Askýda yemek'),

(12, 13, 280, GETDATE(), 'Ýhtiyaç sahibi desteði'),
(14, 15, 205, GETDATE(), 'Aský kullanýmý'),
(16, 17, 170, GETDATE(), 'Ücretsiz sipariþ'),
(18, 19, 130, GETDATE(), 'Askýda yemek desteði'),
(20, 21, 260, GETDATE(), 'Sosyal destek sipariþi');