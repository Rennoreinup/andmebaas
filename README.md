# andmebaas

# Andmebaasi skeemi ülesanne

See projekt sisaldab andmebaasiskeemi, kus on rakendatud võõrvõtmete piirangud ja indeksid.

## Teostatud sammud:
1. **Võõrvõtmed (Foreign Keys):** Lisatud `ON DELETE CASCADE` piirangud. Kui klient kustutatakse, eemaldatakse automaatselt ka tema tellimused ja tellimuse read.
2. **Indeksid:** Loodud indeksid `customer_id`, `order_id` ja `product_id` väljadele, et optimeerida JOIN päringuid.
3. **Testimine:** Skeem toetab `EXPLAIN` päringuid, mis näitavad indeksite kasutust.

## Kuidas kontrollida:
Kasuta faili `schema.sql`, et luua andmebaas ja tabelid.
