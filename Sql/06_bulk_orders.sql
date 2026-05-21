USE YemekSiparisDB;
GO


DECLARE @SiparisNo INT = 21;

WHILE @SiparisNo <= 100
BEGIN
    DECLARE @MusteriID INT;
    DECLARE @RestoranID INT;
    DECLARE @KuryeID INT;
    DECLARE @ToplamTutar DECIMAL(10,2);
    DECLARE @Adres NVARCHAR(250);

    SET @MusteriID = ((@SiparisNo - 1) % 20) + 1;
    SET @KuryeID = ((@SiparisNo - 1) % 5) + 1;

    IF @MusteriID IN (1,2,11,16)
    BEGIN
        SET @RestoranID = 1;
        SET @Adres = 'Ýstanbul';
    END
    ELSE IF @MusteriID IN (3,4,12,17)
    BEGIN
        SET @RestoranID = 2;
        SET @Adres = 'Ankara';
    END
    ELSE IF @MusteriID IN (5,6,13,18)
    BEGIN
        SET @RestoranID = 3;
        SET @Adres = 'Bursa';
    END
    ELSE IF @MusteriID IN (7,8,14,19)
    BEGIN
        SET @RestoranID = 4;
        SET @Adres = 'Ýzmir';
    END
    ELSE
    BEGIN
        SET @RestoranID = 5;
        SET @Adres = 'Antalya';
    END

    SET @ToplamTutar = CAST((RAND() * 300 + 100) AS DECIMAL(10,2));

    INSERT INTO Siparis
    (
        MusteriID,
        RestoranID,
        KuryeID,
        SiparisTarihi,
        SiparisDurumu,
        ToplamTutar,
        TeslimatAdresi
    )
    VALUES
    (
        @MusteriID,
        @RestoranID,
        @KuryeID,
        DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 30, GETDATE()),
        'Teslim Edildi',
        @ToplamTutar,
        @Adres
    );

    DECLARE @YeniSiparisID INT = SCOPE_IDENTITY();

    INSERT INTO SiparisDetay
    (
        SiparisID,
        UrunID,
        Adet,
        BirimFiyat
    )
    VALUES
    (
        @YeniSiparisID,
        ((@RestoranID - 1) * 10) + 1,
        1,
        @ToplamTutar
    );

    INSERT INTO Odeme
    (
        SiparisID,
        OdemeTuru,
        OdemeTarihi,
        OdemeDurumu
    )
    VALUES
    (
        @YeniSiparisID,
        'Kredi Kartý',
        GETDATE(),
        'Baþarýlý'
    );

    SET @SiparisNo = @SiparisNo + 1;
END;
GO



