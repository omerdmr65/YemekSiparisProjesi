USE YemekSiparisDB;
GO

INSERT INTO Kategori (KategoriAdi, IsActive) VALUES
('Burger', 1),
('Pizza', 1),
('Döner', 1),
('Tatlý', 1),
('Ýçecek', 1),
('Kahvaltý', 1),
('Tavuk', 1),
('Kebap', 1),
('Makarna', 1),
('Salata', 1);

INSERT INTO Restoran (RestoranAdi, Telefon, Adres, Puan, ToplamCiro, IsActive) VALUES
('Burger King', '05000000001', 'Ýstanbul', 4.2, 0, 1),
('Dominos', '05000000002', 'Ankara', 4.0, 0, 1),
('HD Ýskender', '05000000003', 'Bursa', 4.5, 0, 1),
('Simit Sarayý', '05000000004', 'Ýzmir', 3.8, 0, 1),
('Tavuk Dünyasý', '05000000005', 'Antalya', 4.3, 0, 1);

INSERT INTO Musteri (Ad, Soyad, Telefon, Email, Adres, KayitTarihi, IsActive) VALUES
('Ahmet', 'Yýlmaz', '05000000011', 'ahmet1@gmail.com', 'Ýstanbul', GETDATE(), 1),
('Mehmet', 'Kaya', '05000000012', 'mehmet2@gmail.com', 'Ýstanbul', GETDATE(), 1),
('Ayþe', 'Demir', '05000000013', 'ayse3@gmail.com', 'Ankara', GETDATE(), 1),
('Fatma', 'Çelik', '05000000014', 'fatma4@gmail.com', 'Ankara', GETDATE(), 1),
('Ali', 'Þahin', '05000000015', 'ali5@gmail.com', 'Bursa', GETDATE(), 1),
('Zeynep', 'Koç', '05000000016', 'zeynep6@gmail.com', 'Bursa', GETDATE(), 1),
('Hasan', 'Aydýn', '05000000017', 'hasan7@gmail.com', 'Ýzmir', GETDATE(), 1),
('Emine', 'Öztürk', '05000000018', 'emine8@gmail.com', 'Ýzmir', GETDATE(), 1),
('Murat', 'Arslan', '05000000019', 'murat9@gmail.com', 'Antalya', GETDATE(), 1),
('Elif', 'Doðan', '05000000020', 'elif10@gmail.com', 'Antalya', GETDATE(), 1),
('Burak', 'Kurt', '05000000021', 'burak11@gmail.com', 'Ýstanbul', GETDATE(), 1),
('Cem', 'Özdemir', '05000000022', 'cem12@gmail.com', 'Ankara', GETDATE(), 1),
('Deniz', 'Yýldýz', '05000000023', 'deniz13@gmail.com', 'Bursa', GETDATE(), 1),
('Ece', 'Aksoy', '05000000024', 'ece14@gmail.com', 'Ýzmir', GETDATE(), 1),
('Furkan', 'Polat', '05000000025', 'furkan15@gmail.com', 'Antalya', GETDATE(), 1),
('Gizem', 'Çetin', '05000000026', 'gizem16@gmail.com', 'Ýstanbul', GETDATE(), 1),
('Hakan', 'Güneþ', '05000000027', 'hakan17@gmail.com', 'Ankara', GETDATE(), 1),
('Ýrem', 'Kara', '05000000028', 'irem18@gmail.com', 'Bursa', GETDATE(), 1),
('Kaan', 'Bulut', '05000000029', 'kaan19@gmail.com', 'Ýzmir', GETDATE(), 1),
('Leyla', 'Yavuz', '05000000030', 'leyla20@gmail.com', 'Antalya', GETDATE(), 1);

INSERT INTO Kurye (Ad, Soyad, Telefon, AracTipi, IsActive) VALUES
('Kemal', 'Yýldýrým', '05000000101', 'Motor', 1),
('Serkan', 'Kara', '05000000102', 'Motor', 1),
('Tolga', 'Acar', '05000000103', 'Araba', 1),
('Onur', 'Þen', '05000000104', 'Motor', 1),
('Emre', 'Koç', '05000000105', 'Araba', 1);



INSERT INTO Urun (RestoranID, KategoriID, UrunAdi, Aciklama, Fiyat, StokDurumu, IsActive) VALUES

-- RESTORAN 1 (Burger)
(1, 1, 'Classic Burger', 'Klasik burger', 120, 1, 1),
(1, 1, 'Cheeseburger', 'Peynirli burger', 110, 1, 1),
(1, 1, 'Double Burger', 'Çift kat burger', 140, 1, 1),
(1, 1, 'Chicken Burger', 'Tavuk burger', 100, 1, 1),
(1, 1, 'BBQ Burger', 'Barbekü soslu burger', 130, 1, 1),
(1, 1, 'Steak Burger', 'Et burger', 150, 1, 1),
(1, 5, 'Kola', 'Soðuk kola', 30, 1, 1),
(1, 5, 'Ayran', 'Soðuk ayran', 20, 1, 1),
(1, 4, 'Dondurma', 'Vanilyalý dondurma', 50, 1, 1),
(1, 4, 'Cheesecake', 'Frambuazlý cheesecake', 90, 1, 1),

-- RESTORAN 2 (Pizza)
(2, 2, 'Karýþýk Pizza', 'Büyük boy pizza', 150, 1, 1),
(2, 2, 'Sucuklu Pizza', 'Sucuklu pizza', 140, 1, 1),
(2, 2, 'Margarita Pizza', 'Klasik pizza', 130, 1, 1),
(2, 2, 'Ton Balýklý Pizza', 'Ton balýklý pizza', 160, 1, 1),
(2, 2, 'Sebzeli Pizza', 'Sebzeli pizza', 135, 1, 1),
(2, 2, '4 Peynirli Pizza', 'Peynirli pizza', 145, 1, 1),
(2, 5, 'Fanta', 'Portakallý içecek', 30, 1, 1),
(2, 5, 'Ice Tea', 'Soðuk çay', 35, 1, 1),
(2, 4, 'Tiramisu', 'Kahveli tatlý', 90, 1, 1),
(2, 4, 'Profiterol', 'Çikolatalý tatlý', 80, 1, 1),

-- RESTORAN 3 (Döner / Ýskender)
(3, 3, 'Ýskender', 'Bursa iskender', 180, 1, 1),
(3, 3, 'Döner Porsiyon', 'Et döner', 130, 1, 1),
(3, 3, 'Tavuk Döner', 'Tavuk döner', 120, 1, 1),
(3, 3, 'Et Döner Dürüm', 'Dürüm döner', 110, 1, 1),
(3, 3, 'Pilav Üstü Döner', 'Pilavlý döner', 135, 1, 1),
(3, 3, 'Yoðurtlu Döner', 'Yoðurtlu döner', 140, 1, 1),
(3, 5, 'Su', 'Doðal su', 10, 1, 1),
(3, 5, 'Maden Suyu', 'Soda', 15, 1, 1),
(3, 4, 'Baklava', 'Fýstýklý baklava', 120, 1, 1),
(3, 4, 'Sütlaç', 'Fýrýn sütlaç', 60, 1, 1),

-- RESTORAN 4 (Kahvaltý / Cafe)
(4, 6, 'Kahvaltý Tabaðý', 'Serpme kahvaltý', 160, 1, 1),
(4, 6, 'Menemen', 'Domatesli yumurta', 90, 1, 1),
(4, 6, 'Omlet', 'Peynirli omlet', 80, 1, 1),
(4, 6, 'Tost', 'Kaþarlý tost', 70, 1, 1),
(4, 6, 'Simit', 'Taze simit', 25, 1, 1),
(4, 6, 'Pankek', 'Tatlý pankek', 85, 1, 1),
(4, 5, 'Çay', 'Sýcak çay', 15, 1, 1),
(4, 5, 'Kahve', 'Sýcak kahve', 40, 1, 1),
(4, 4, 'Revani', 'Þerbetli tatlý', 65, 1, 1),
(4, 4, 'Magnolia', 'Muzlu tatlý', 85, 1, 1),

-- RESTORAN 5 (Tavuk)
(5, 7, 'Tavuk Izgara', 'Izgara tavuk', 140, 1, 1),
(5, 7, 'Tavuk Pilav', 'Pilavlý tavuk', 120, 1, 1),
(5, 7, 'Tavuk Sote', 'Sote tavuk', 130, 1, 1),
(5, 7, 'Tavuk Þiþ', 'Þiþ tavuk', 150, 1, 1),
(5, 7, 'Köri Soslu Tavuk', 'Köri tavuk', 145, 1, 1),
(5, 7, 'Acýlý Tavuk', 'Acýlý tavuk', 135, 1, 1),
(5, 5, 'Limonata', 'Taze limonata', 35, 1, 1),
(5, 5, 'Meyve Suyu', 'Karýþýk meyve suyu', 40, 1, 1),
(5, 4, 'Künefe', 'Hatay künefe', 110, 1, 1),
(5, 4, 'Kazandibi', 'Sütlü tatlý', 70, 1, 1);


INSERT INTO Urun (RestoranID, KategoriID, UrunAdi, Aciklama, Fiyat, StokDurumu, IsActive) VALUES

(3, 8, 'Adana Kebap', 'Acýlý kebap', 170, 1, 1),
(3, 8, 'Urfa Kebap', 'Acýsýz kebap', 165, 1, 1),

(4, 9, 'Napoliten Makarna', 'Domates soslu makarna', 110, 1, 1),
(4, 9, 'Kremalý Makarna', 'Kremalý penne', 120, 1, 1),

(5, 10, 'Sezar Salata', 'Tavuklu salata', 90, 1, 1),
(5, 10, 'Akdeniz Salata', 'Zeytinli salata', 85, 1, 1);