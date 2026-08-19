-- Dzień 9 - Grupowanie i agregacja danych
-- GROUP BY, COUNT, SUM, AVG, HAVING

USE data_analyst_bootcamp;

-- =============================================
-- 1. Wyświetlanie wszystkich danych
-- =============================================
SELECT * FROM sprzedaz;

-- =============================================
-- 2. Produkty droższe niż 500 zł
-- =============================================
SELECT * FROM sprzedaz
WHERE cena > 500;

-- =============================================
-- 3. Sortowanie produktów od najdroższego
-- =============================================
SELECT produkt, cena FROM sprzedaz
ORDER BY cena DESC;

-- =============================================
-- 4. Dodawanie kolumny kategoria
-- =============================================
ALTER TABLE sprzedaz
ADD COLUMN kategoria VARCHAR(50);

-- =============================================
-- 5. Uzupełnianie kategorii produktów
-- =============================================
UPDATE sprzedaz
SET kategoria = 'Komputery'
WHERE produkt = 'Laptop';

UPDATE sprzedaz
SET kategoria = 'Komputery'
WHERE produkt = 'Monitor';

UPDATE sprzedaz
SET kategoria = 'Akcesoria'
WHERE produkt = 'Klawiatura';

UPDATE sprzedaz
SET kategoria = 'Akcesoria'
WHERE produkt = 'Mysz';

SELECT * FROM sprzedaz;

-- =============================================
-- 6. Liczba produktów w każdej kategorii
-- =============================================
SELECT kategoria, COUNT(*) AS 'liczba_produktow'
FROM sprzedaz
GROUP BY kategoria;

-- =======================================================
-- 7. Łączna liczba sprzedanych sztuk w każdej kategorii
-- =======================================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
GROUP BY kategoria;

-- =============================================
-- 8. Średnia cena produktu w każdej kategorii
-- =============================================
SELECT kategoria, AVG(cena) AS 'srednia_cena'
FROM sprzedaz
GROUP BY kategoria;

-- ================================================
-- 9. Kategorie ze sprzedażą większą niż 10 sztuk
-- ================================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
GROUP BY kategoria
HAVING SUM(liczba_sztuk) > 10;

-- =============================================
-- 10. Filtrowanie danych przed i po grupowaniu
-- =============================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
WHERE cena > 200
GROUP BY kategoria
HAVING SUM(liczba_sztuk) >= 5;

-- =============================================
-- 11. Kategorie ze średnią ceną powyżej 500 zł
-- =============================================
SELECT kategoria, AVG(cena) AS 'srednia_cena'
FROM sprzedaz
GROUP BY kategoria
HAVING AVG(cena) > 500
ORDER BY srednia_cena DESC;

-- =============================================
-- 12. Finalny challenge - analiza kategorii
-- =============================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
WHERE cena > 200
GROUP BY kategoria
HAVING SUM(liczba_sztuk) >= 5
ORDER BY liczba_sztuk_lacznie DESC;