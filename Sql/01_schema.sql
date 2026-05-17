CREATE DATABASE YemekSiparisDB;
GO

USE YemekSiparisDB;
GO

CREATE TABLE Musteri (
    MusteriID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(20) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Adres NVARCHAR(250) NOT NULL,
    KayitTarihi DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);

CREATE TABLE Restoran (
    RestoranID INT PRIMARY KEY IDENTITY(1,1),
    RestoranAdi NVARCHAR(100) NOT NULL,
    Telefon NVARCHAR(20) NOT NULL UNIQUE,
    Adres NVARCHAR(250) NOT NULL,
    Puan DECIMAL(2,1) CHECK (Puan BETWEEN 1 AND 5),
    ToplamCiro DECIMAL(12,2) DEFAULT 0,
    KayitTarihi DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);

CREATE TABLE Kurye (
    KuryeID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(20) NOT NULL UNIQUE,
    AracTipi NVARCHAR(30) NOT NULL,
    IsActive BIT DEFAULT 1
);

CREATE TABLE Kategori (
    KategoriID INT PRIMARY KEY IDENTITY(1,1),
    KategoriAdi NVARCHAR(50) NOT NULL UNIQUE,
    IsActive BIT DEFAULT 1
);

CREATE TABLE Urun (
    UrunID INT PRIMARY KEY IDENTITY(1,1),
    RestoranID INT NOT NULL,
    KategoriID INT NOT NULL,
    UrunAdi NVARCHAR(100) NOT NULL,
    Aciklama NVARCHAR(250),
    Fiyat DECIMAL(10,2) NOT NULL CHECK (Fiyat > 0),
    StokDurumu BIT DEFAULT 1,
    IsActive BIT DEFAULT 1,

    FOREIGN KEY (RestoranID)
    REFERENCES Restoran(RestoranID),

    FOREIGN KEY (KategoriID)
    REFERENCES Kategori(KategoriID)
);

CREATE TABLE Siparis (
    SiparisID INT PRIMARY KEY IDENTITY(1,1),

    MusteriID INT NOT NULL,
    RestoranID INT NOT NULL,
    KuryeID INT,

    SiparisTarihi DATETIME DEFAULT GETDATE(),

    SiparisDurumu NVARCHAR(30) NOT NULL,

    ToplamTutar DECIMAL(10,2)
    CHECK (ToplamTutar > 0),

    TeslimatAdresi NVARCHAR(250) NOT NULL,

    FOREIGN KEY (MusteriID)
    REFERENCES Musteri(MusteriID),

    FOREIGN KEY (RestoranID)
    REFERENCES Restoran(RestoranID),

    FOREIGN KEY (KuryeID)
    REFERENCES Kurye(KuryeID)
);

CREATE TABLE SiparisDetay (
    SiparisDetayID INT PRIMARY KEY IDENTITY(1,1),

    SiparisID INT NOT NULL,
    UrunID INT NOT NULL,

    Adet INT NOT NULL CHECK (Adet > 0),

    BirimFiyat DECIMAL(10,2)
    NOT NULL CHECK (BirimFiyat > 0),

    FOREIGN KEY (SiparisID)
    REFERENCES Siparis(SiparisID),

    FOREIGN KEY (UrunID)
    REFERENCES Urun(UrunID)
);

CREATE TABLE Odeme (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),

    SiparisID INT NOT NULL UNIQUE,

    OdemeTuru NVARCHAR(30) NOT NULL,

    OdemeTarihi DATETIME DEFAULT GETDATE(),

    OdemeDurumu NVARCHAR(30) NOT NULL,

    FOREIGN KEY (SiparisID)
    REFERENCES Siparis(SiparisID)
);