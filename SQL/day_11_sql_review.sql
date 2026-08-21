-- Dzień 11 - Powtórka SQL

USE data_analyst_bootcamp;

-- =============================================
-- 1. Filtrowanie sprzedaży według kategorii
-- =============================================
SELECT kategoria, SUM(liczba_sztuk) AS 'liczba_sztuk_lacznie'
FROM sprzedaz
GROUP BY kategoria
HAVING liczba_sztuk_lacznie > 10;

-- =============================================
-- 2. Łączennie produktów z zamówieniami
-- =============================================
SELECT p.produkt, p.kategoria, z.liczba_sztuk
FROM produkty AS p
INNER JOIN zamowienia AS z
	ON p.id = z.produkt_id;
    
-- =============================================
-- 3. Łączna sprzedaż wszystkich produktów
-- =============================================
SELECT p.produkt, SUM(z.liczba_sztuk) AS sprzedane_sztuki
FROM produkty AS p
LEFT JOIN zamowienia AS z
	ON p.id = z.produkt_id
GROUP BY p.produkt;

