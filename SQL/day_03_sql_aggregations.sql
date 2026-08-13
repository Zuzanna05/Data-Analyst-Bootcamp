-- Dzień 3 - Sortowanie i funkcje agregujące
-- ORDER BY, LIMIT, COUNT, SUM, AVG

USE data_analyst_bootcamp;

-- =============================================
-- 1. Sortowanie produktów od najdroższego
-- =============================================
SELECT * FROM sprzedaz
ORDER BY cena DESC;

-- =============================================
-- 2. Trzy najlepiej sprzedające się produkty
-- =============================================
SELECT * FROM sprzedaz
ORDER BY liczba_sztuk DESC
LIMIT 3;

-- =============================================
-- 3. Liczba wszystkich produktów
-- =============================================
SELECT COUNT(*) FROM sprzedaz;

-- =============================================
-- 4. Liczba produktów droższych niż 500 zł
-- =============================================
SELECT COUNT(*) FROM sprzedaz
WHERE cena > 500;

-- =============================================
-- 5. Łączna liczba sprzedanych sztuk
-- =============================================
SELECT SUM(liczba_sztuk) FROM sprzedaz;

-- =======================================================
-- 6. Liczba sprzedanych sztuk produktów poniżej 1000 zł
-- =======================================================
SELECT SUM(liczba_sztuk) FROM sprzedaz
WHERE cena < 1000;

-- =============================================
-- 7. Średnia cena produktów
-- =============================================
SELECT AVG(cena) FROM sprzedaz;

-- =======================================================
-- 8. Dwa najtańsze produkty kosztujące poniżej 1000 zł
-- =======================================================
SELECT produkt, cena FROM sprzedaz
WHERE cena < 1000
ORDER BY cena ASC
LIMIT 2;