PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS musicians;

DROP TABLE IF EXISTS bands;

CREATE TABLE
  bands (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100)
  );

CREATE TABLE
  musicians (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    band_id INTEGER,
    -- Step 2: Add CASCADE
    CONSTRAINT FK_BANDS_MUSICIAN_Cascade FOREIGN KEY (band_id) REFERENCES bands (id) ON DELETE CASCADE
  );

INSERT INTO
  bands
VALUES
  (1, 'The Falling Box'),
  (2, 'America The Piano'),
  (3, 'Loved Autumn'),
  (4, 'Playin Sound'),
  (5, 'The King River');

INSERT INTO
  musicians
VALUES
  (1, 'Adam', 'Appleby', 1),
  (2, 'Anton', 'Martinovic', 1),
  (3, 'Wilson', 'Holt', 1),
  (4, 'Marine', 'Sweet', 2),
  (5, 'Georgette', 'Kubo', 2),
  (6, 'Aurora', 'Hase', 3),
  (7, 'Trenton', 'Lesley', 4),
  (8, 'Camila', 'Nenci', 4),
  (9, 'Rosemarie', 'Affini', 5),
  (10, 'Victoria', 'Cremonesi', 5);

-- Your code here
-- Step 1: Delete without CASCADE
-- Delete from bands where id = 1;
-- Step 2: Add CASCADE
-- Step 3: Delete a band
DELETE FROM bands
WHERE
  id = 1; -- this deletes the musicians with the band id = 1 from the musician table as well
