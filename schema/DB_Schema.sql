CREATE SCHEMA [swps]
GO

CREATE TABLE [swps].[Standort] (
  [Standort_ID] uniqueidentifier PRIMARY KEY NOT NULL,
  [Name] varchar(100) NOT NULL
)
GO

CREATE TABLE [swps].[Personen] (
  [Personen_ID] uniqueidentifier PRIMARY KEY NOT NULL,
  [Aktiv] bit NOT NULL,
  [Anrede] varchar(50) NOT NULL,
  [Name] varchar(100) NOT NULL,
  [Vorname] varchar(100) NOT NULL,
  [Mail] varchar(100) NOT NULL,
  [Standort_ID] uniqueidentifier
)
GO

CREATE TABLE [swps].[PersonenExt] (
  [Personen_ID] uniqueidentifier PRIMARY KEY NOT NULL,
  [PIN] varchar(50),
  [Latest_update] datetime NOT NULL
)
GO

CREATE TABLE [swps].[Produkt] (
  [Produkt_ID] uniqueidentifier PRIMARY KEY NOT NULL,
  [Name] varchar(50) NOT NULL,
  [Preis] integer NOT NULL,
  [Standort_ID] uniqueidentifier NOT NULL,
  [Latest_update] datetime NOT NULL
)
GO

CREATE TABLE [swps].[Transaktion] (
  [Transaktions_ID] uniqueidentifier PRIMARY KEY NOT NULL,
  [Personen_ID] uniqueidentifier NOT NULL,
  [Produkt_ID] uniqueidentifier NOT NULL,
  [Anzahl] integer NOT NULL,
  [Transaktionszeitpunkt] datetime NOT NULL,
  [Abrechnungszeitpunkt] datetime
)
GO

ALTER TABLE [swps].[PersonenExt] ADD FOREIGN KEY ([Personen_ID]) REFERENCES [swps].[Personen] ([Personen_ID])
GO

ALTER TABLE [swps].[Transaktion] ADD FOREIGN KEY ([Personen_ID]) REFERENCES [swps].[Personen] ([Personen_ID])
GO

ALTER TABLE [swps].[Personen] ADD FOREIGN KEY ([Standort_ID]) REFERENCES [swps].[Standort] ([Standort_ID])
GO

ALTER TABLE [swps].[Produkt] ADD FOREIGN KEY ([Standort_ID]) REFERENCES [swps].[Standort] ([Standort_ID])
GO

ALTER TABLE [swps].[Transaktion] ADD FOREIGN KEY ([Produkt_ID]) REFERENCES [swps].[Produkt] ([Produkt_ID])
GO
