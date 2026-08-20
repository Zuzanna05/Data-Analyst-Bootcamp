-- Dzień 10 - SQL JOIN i łączenie tabel
-- INNER JOIN, LEFT JOIN, klucze i analiza danych

USE data_analyst_bootcamp;

-- =============================================
-- 1. Filtrowanie produktów według ceny
-- =============================================
SELECT produkt, cena, liczba_sztuk
FROM sprzedaz
WHERE cena > 500;

-- ====================================================
-- 2. Łączna liczba sprzedanych sztuk według kategorii
-- ====================================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
GROUP BY kategoria;

-- =======================================================
-- 3. Filtrowanie i sortowanie sprzedaży według kategorii
-- =======================================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
GROUP BY kategoria
HAVING liczba_sztuk_lacznie > 10
ORDER BY liczba_sztuk_lacznie DESC;

-- =============================================
-- 4. Tworzenie tabeli produkty
-- =============================================
CREATE TABLE produkty (
	id INT PRIMARY KEY AUTO_INCREMENT,
    produkt VARCHAR(100),
    kategoria VARCHAR(50),
    cena DECIMAL(10,2)
);

-- =============================================
-- 5. Dodawanie danych do tabeli produkty
-- =============================================
INSERT INTO produkty (produkt, kategoria, cena)
VALUES
('Laptop', 'Komputery', 3499.99),
('Monitor', 'Komputery', 899.99),
('Klawiatura', 'Akcesoria', 249.90),
('Mysz', 'Akcesoria', 129.99);

-- =============================================
-- 6. Tworzenie tabeli zamowienia
-- =============================================
CREATE TABLE zamowienia (
	id INT PRIMARY KEY AUTO_INCREMENT,
    produkt_id INT,
    liczba_sztuk INT
);
SELECT * FROM zamowienia;
-- =============================================
-- 7. Dodawanie danych do tabeli zamowienia
-- =============================================
INSERT INTO zamowienia (produkt_id, liczba_sztuk)
VALUES
(1, 2),
(2,5),
(1,3),
(4,10),
(3,4);

-- =============================================
-- 8. Łączenie tabel za pomocą INNER JOIN
-- =============================================
SELECT p.produkt, z.liczba_sztuk
FROM produkty AS p
INNER JOIN zamowienia AS z
	ON p.id = z.produkt_id;
    
-- =============================================
-- 9. Wyświetlanie danych z połączonych tabel
-- =============================================
SELECT p.produkt, p.kategoria, p.cena, z.liczba_sztuk
FROM produkty AS p
INNER JOIN zamowienia AS z
	ON p.id = z.produkt_id;

-- ======================================================
-- 10. Obliczanie wartości sprzedaży po połączeniu tabel
-- ======================================================
SELECT p.produkt, p.cena, z.liczba_sztuk, p.cena * z.liczba_sztuk AS 'wartosc_sprzedazy'
FROM produkty AS p
INNER JOIN zamowienia AS z
	ON p.id = z.produkt_id;
    
-- ======================================================
-- 11. Łączna wartość sprzedaży według produktu
-- ======================================================
SELECT p.produkt, SUM(p.cena * z.liczba_sztuk) AS 'laczna_wartosc_sprzedazy'
FROM produkty AS p
INNER JOIN zamowienia AS z
	ON p.id = z.produkt_id
GROUP BY p.produkt;

-- ======================================================
-- 12. Ranking produktów według wartości sprzedaży
-- ======================================================
SELECT p.produkt, SUM(p.cena * z.liczba_sztuk) AS 'laczna_wartosc_sprzedazy'
FROM produkty AS p
INNER JOIN zamowienia AS z
	ON p.id = z.produkt_id
GROUP BY p.produkt
ORDER BY laczna_wartosc_sprzedazy DESC;

-- ======================================================
-- 13. Produkt bez zamówień
-- ======================================================
INSERT INTO produkty (produkt, kategoria, cena)
VALUES
('Słuchawki', 'Akcesoria', 399.99);

-- ==========================================================
-- 14. Wyświetlanie wszystkich produktów za pomocą LEFT JOIN
-- ==========================================================
SELECT p.produkt, p.kategoria, p.cena, z.liczba_sztuk
FROM produkty AS p
LEFT JOIN zamowienia AS z
	ON p.id = z.produkt_id;
    
-- =============================================================
-- 15. Łączna liczba sprzedanych sztuk dla wszystkich produktów
-- =============================================================
SELECT p.produkt, SUM(z.liczba_sztuk) AS 'sprzedane_sztuki'
FROM produkty AS p
LEFT JOIN zamowienia AS z
	ON p.id = z.produkt_id
GROUP BY p.produkt;
