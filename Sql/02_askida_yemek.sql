CREATE TABLE IhtiyacSahibiDogrulama (
    DogrulamaID INT PRIMARY KEY IDENTITY(1,1),

    MusteriID INT NOT NULL UNIQUE,

    DogrulamaDurumu NVARCHAR(30) NOT NULL
        CHECK (DogrulamaDurumu IN ('Beklemede', 'Onaylandi', 'Reddedildi')),

    DogrulamaTarihi DATETIME DEFAULT GETDATE(),

    Aciklama NVARCHAR(250),

    IsActive BIT DEFAULT 1,

    FOREIGN KEY (MusteriID)
    REFERENCES Musteri(MusteriID)
);
CREATE TABLE AskidaBagis (
    BagisID INT PRIMARY KEY IDENTITY(1,1),

    BagisYapanMusteriID INT NOT NULL,

    BagisTutari DECIMAL(10,2) NOT NULL
        CHECK (BagisTutari > 0),

    BagisTarihi DATETIME DEFAULT GETDATE(),

    AnonimMi BIT DEFAULT 0,

    Aciklama NVARCHAR(250),

    IsActive BIT DEFAULT 1,

    FOREIGN KEY (BagisYapanMusteriID)
    REFERENCES Musteri(MusteriID)
);
CREATE TABLE AskidaKullanim (
    KullanimID INT PRIMARY KEY IDENTITY(1,1),

    MusteriID INT NOT NULL,

    SiparisID INT NOT NULL UNIQUE,

    KullanilanTutar DECIMAL(10,2) NOT NULL
        CHECK (KullanilanTutar > 0),

    KullanimTarihi DATETIME DEFAULT GETDATE(),

    Aciklama NVARCHAR(250),

    FOREIGN KEY (MusteriID)
    REFERENCES Musteri(MusteriID),

    FOREIGN KEY (SiparisID)
    REFERENCES Siparis(SiparisID)
);