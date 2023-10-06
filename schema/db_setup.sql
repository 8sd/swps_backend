IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'swps')
  BEGIN
    PRINT 'The "swps" schema does not exist. Creating';
    EXEC('CREATE SCHEMA swps;');
    CREATE TABLE [swps].[Standort] (
      [Standort_ID] uniqueidentifier PRIMARY KEY NOT NULL,
      [Name] varchar(100) NOT NULL
    );

    CREATE TABLE [swps].[Personen] (
      [Personen_ID] uniqueidentifier PRIMARY KEY NOT NULL,
      [Aktiv] bit NOT NULL,
      [Anrede] varchar(50) NOT NULL,
      [Name] varchar(100) NOT NULL,
      [Vorname] varchar(100) NOT NULL,
      [Mail] varchar(100) NOT NULL,
      [Standort_ID] uniqueidentifier
    );

    CREATE TABLE [swps].[PersonenExt] (
      [Personen_ID] uniqueidentifier PRIMARY KEY NOT NULL,
      [PIN] varchar(50),
      [Latest_update] datetime NOT NULL
    );

    CREATE TABLE [swps].[Produkt] (
      [Produkt_ID] uniqueidentifier PRIMARY KEY NOT NULL,
      [Name] varchar(50) NOT NULL,
      [Preis] integer NOT NULL,
      [Standort_ID] uniqueidentifier NOT NULL,
      [Latest_update] datetime NOT NULL
    );

    CREATE TABLE [swps].[Transaktion] (
      [Transaktions_ID] uniqueidentifier PRIMARY KEY NOT NULL,
      [Personen_ID] uniqueidentifier NOT NULL,
      [Produkt_ID] uniqueidentifier NOT NULL,
      [Anzahl] integer NOT NULL,
      [Transaktionszeitpunkt] datetime NOT NULL,
      [Abrechnungszeitpunkt] datetime
    );

    ALTER TABLE [swps].[PersonenExt] ADD FOREIGN KEY ([Personen_ID]) REFERENCES [swps].[Personen] ([Personen_ID]);

    ALTER TABLE [swps].[Transaktion] ADD FOREIGN KEY ([Personen_ID]) REFERENCES [swps].[Personen] ([Personen_ID]);

    ALTER TABLE [swps].[Personen] ADD FOREIGN KEY ([Standort_ID]) REFERENCES [swps].[Standort] ([Standort_ID]);

    ALTER TABLE [swps].[Produkt] ADD FOREIGN KEY ([Standort_ID]) REFERENCES [swps].[Standort] ([Standort_ID]);

    ALTER TABLE [swps].[Transaktion] ADD FOREIGN KEY ([Produkt_ID]) REFERENCES [swps].[Produkt] ([Produkt_ID]);

    INSERT INTO master.swps.Standort (Standort_ID,Name) VALUES
      (N'9DE9172B-A4E7-4A1C-9F97-4BC65C8DDE20',N'Augsburg'),
      (N'E54CE9BB-30C8-4111-806C-DA74755EF264',N'Hohenheim'),
      (N'1F18FE1C-EF61-463B-9DE2-0B627F873F50',N'Kempten'),
      (N'27DBA2D7-FB77-49B4-A133-57677BA5B651',N'Frankfurt'),
      (N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787',N'Bayreuth');

    INSERT INTO master.swps.Personen (Personen_ID,Aktiv,Anrede,Name,Vorname,Mail,Standort_ID) VALUES
      (N'52B9ED76-C45B-4CED-97EA-8DA7FC046465',1,N'Herr',N'Duda',N'Sebastian',N'sebastian.duda@fim-rc.de',N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787'),
      (N'EBBBF138-9710-43A6-9C7A-5029375104E7',1,N'Herr',N'Guggenberger',N'Tobias',N'tobias.guggenberger@fim-rc.de',N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787'),
      (N'143B0B85-D4D5-413E-87A4-BB2D7865B399',0,N'Frau',N'Medhurst',N'Terry',N'atuny0@sohu.com',N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787'),
      (N'ACBC2F96-71D3-47D5-AF7A-8759DA00DE51',1,N'Frau',N'Röchert',N'Alison',N'jtreleven5@nhs.uk',N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787'),
      (N'276670D1-42DA-4EE0-BD8D-DC3717E45CD0',1,N'Herr',N'Quigley',N'Sheldon',N'hbingley1@plala.or.jp',N'9DE9172B-A4E7-4A1C-9F97-4BC65C8DDE20');

    INSERT INTO master.swps.PersonenExt (Personen_ID,PIN,Latest_update) VALUES
      (N'52B9ED76-C45B-4CED-97EA-8DA7FC046465',N'1234','2023-05-10 09:21:00.0'),
      (N'EBBBF138-9710-43A6-9C7A-5029375104E7',NULL,'2023-05-10 09:21:00.0'),
      (N'143B0B85-D4D5-413E-87A4-BB2D7865B399',NULL,'2023-05-10 09:21:00.0'),
      (N'ACBC2F96-71D3-47D5-AF7A-8759DA00DE51',NULL,'2023-05-10 09:21:00.0'),
      (N'276670D1-42DA-4EE0-BD8D-DC3717E45CD0',NULL,'2023-05-10 09:21:00.0');

    INSERT INTO master.swps.Produkt (Produkt_ID,Name,Preis,Standort_ID,Latest_update) VALUES
      (N'C59535DC-07D0-4598-A005-EFB6C72EE8CA',N'Kaffee',25,N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787','2023-05-10 09:22:00.0'),
      (N'31F31304-3CD3-42BB-9E17-6D2266A8D73B',N'Wasser',50,N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787','2023-05-10 09:22:00.0'),
      (N'3F776420-92AD-41E5-A438-3D7CCF907D91',N'Snickers',120,N'0C8F3F20-63F3-44E3-A9D4-18D6ED409787','2023-05-10 09:22:00.0'),
      (N'2D1AA0E6-A321-49BF-9BB7-A143335B36A9',N'Kaffee',40,N'9DE9172B-A4E7-4A1C-9F97-4BC65C8DDE20','2023-05-10 09:22:00.0'),
      (N'5DB93BA0-008A-4C94-8D8A-1F8BF2EBEACE',N'Wasser',50,N'9DE9172B-A4E7-4A1C-9F97-4BC65C8DDE20','2023-05-10 09:22:00.0');

    INSERT INTO master.swps.Transaktion (Transaktions_ID,Personen_ID,Produkt_ID,Anzahl,Transaktionszeitpunkt,Abrechnungszeitpunkt) VALUES
      (N'4544DA03-C874-4109-93D8-9CBD8C08BDB6',N'276670D1-42DA-4EE0-BD8D-DC3717E45CD0',N'2D1AA0E6-A321-49BF-9BB7-A143335B36A9',2,'2023-05-10 09:24:00.0',NULL),
      (N'B403E514-10BB-4736-9004-AA1102BFBD64',N'52B9ED76-C45B-4CED-97EA-8DA7FC046465',N'C59535DC-07D0-4598-A005-EFB6C72EE8CA',3,'2023-05-10 09:24:00.0',NULL),
      (N'2FC22533-D474-422D-87A9-C6D75E359006',N'EBBBF138-9710-43A6-9C7A-5029375104E7',N'3F776420-92AD-41E5-A438-3D7CCF907D91',1,'2023-05-10 09:24:00.0',NULL),
      (N'1E979AB4-340E-4F87-BC7A-DC8030794896',N'52B9ED76-C45B-4CED-97EA-8DA7FC046465',N'3F776420-92AD-41E5-A438-3D7CCF907D91',1,'2023-05-10 09:24:00.0','2023-05-09 09:24:00.0');
  END;
ELSE
  BEGIN
    PRINT 'The "swps" schema did exist. Do nothing';
  END;