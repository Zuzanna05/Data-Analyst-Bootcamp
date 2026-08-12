-- Dzień 2 - Podstawy SQL
-- Tworzenie tabeli, dodawanie danych, SELECT i WHERE
USE data_analyst_bootcamp;
-- =============================================
-- 1. Tworzenie tabeli
-- =============================================
CREATE TABLE sprzedaz (
	id INT,
    produkt VARCHAR(100),
    cena DECIMAL(10,2),
    liczba_sztuk INT
);

-- =============================================
-- 2. Dodawanie danych
-- =============================================
INSERT INTO sprzedaz (id, produkt, cena, liczba_sztuk)
VALUES (1, 'Laptop', 3499.99, 2);
INSERT INTO sprzedaz (id, produkt, cena, liczba_sztuk)
VALUES (2, 'Monitor', 899.99, 5);
INSERT INTO sprzedaz (id, produkt, cena, liczba_sztuk)
VALUES (3, 'Klawiatura', 249.90, 8);
INSERT INTO sprzedaz (id, produkt, cena, liczba_sztuk)
VALUES (4, 'Mysz', 129.99, 12);

-- =============================================
-- 3. Wyświetlanie wszystkich danych
-- =============================================
SELECT * FROM sprzedaz;

-- =============================================
-- 4. Produkty droższe niż 500 zł
-- =============================================
SELECT * FROM sprzedaz
WHERE cena > 500;

-- ===================================================
-- 5. Produkty, których sprzedano co najmniej 5 sztuk
-- ===================================================
SELECT * FROM sprzedaz
WHERE liczba_sztuk >= 5;

-- =============================================
-- 6. Łączenie warunków za pomocą AND
-- =============================================
SELECT * FROM sprzedaz
WHERE cena < 1000 AND liczba_sztuk >= 8;

-- =============================================
-- 7. Wybieranie konkretnych kolumn
-- =============================================
SELECT produkt, cena FROM sprzedaz;