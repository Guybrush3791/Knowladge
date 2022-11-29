### Schema E-R
Creare lo schema e-r con tutte le entità necessarie a gestire le informazioni di un aeroporto.

Ci sono molti voli, ciascuno dei quali è caratterizzato da un numero, data e aeroporto di partenza, data e aeroporto di arrivo, aereo e compagnia.
Tutti gli aeroporti sono rappresentati da un codice, oltre che dal nome e dalla città.
Per ogni aereo è necessario memorizzare la casa produttrice, modello e numero di posti.
Le compagnie hanno un nome, un codice identificativo e una lista di dipendenti, che possono essere piloti, hostess, steward o manutentori.
Ogni volta che viene effettuato un intervento di manutenzione ad un aereo è necessario registrare un rapporto con data, ora, titolo, descrizione, manutentori e aereo interessato.
Tutti i passeggeri devono identificarsi con nome, cognome, codice fiscale, data di nascita e documento di identità, sia esso carta d'identità o passaporto.
![[Areoporto ER.svg]]

### Query SQL
Dopo aver importato il dump del db contenente i dati ([[Areoporto DB]]), eseguire le seguenti query:
#### Query su singola tabella
1. Selezionare tutti i passeggeri (1000)
```sql
SELECT *
FROM passengers
```

2. Selezionare tutti i nomi degli aeroporti, ordinati per nome (100)
```sql
SELECT *
FROM passengers
ORDER BY name
```
3. Selezionare tutti i passeggeri che hanno come cognome 'Bartell' (2)
```sql
SELECT *
FROM passengers
WHERE lastname LIKE 'Bartell'
```

4. Selezionare tutti i passeggeri minorenni (considerando solo l'anno di nascita) (117 - nel 2022)
```sql
-- FIXED YEAR:
-- ------------
-- SELECT *
-- FROM passengers
-- WHERE YEAR(date_of_birth) > 2004

-- DYNAMIC YEAR
-- ------------
SELECT * 
FROM passengers
WHERE YEAR(date_of_birth) > (YEAR(NOW())-18)
```

5. Selezionare tutti gli aerei che hanno piu' di 200 posti (84)
```sql
SELECT *
FROM airplanes
WHERE seating_capacity > 200
```

6. Selezionare tutti gli aerei che hanno un numero di posti compreso tra 350 e 700 (30)
```sql
SELECT *
FROM airplanes
WHERE seating_capacity > 350
	AND seating_capacity < 700
```

7. Selezionare tutti gli ID dei dipendenti che hanno lasciato almeno una compagnia aerea (31077)
```sql
SELECT employee_id
FROM airline_employee
WHERE layoff_date IS NOT NULL;

-- SOLO ID DIFFERENTI TRA LORO
SELECT DISTINCT employee_id
FROM airline_employee
WHERE layoff_date IS NOT NULL;
```

8. Selezionare tutti gli ID dei dipendenti che hanno lasciato almeno una compagnia aerea prima del 2006 (493)
```sql
SELECT id
FROM airline_employee
WHERE YEAR(layoff_date) < 2006

-- SOLO ID DIFFERENTI TRA LORO
SELECT DISTINCT id
FROM airline_employee
WHERE YEAR(layoff_date) < 2006
```

9. Selezionare tutti i passeggeri il cui nome inizia con 'Al' (26)
```sql
SELECT * 
FROM areoporto.passengers
WHERE name LIKE 'al%'
```

10. Selezionare tutti i passeggeri nati nel 1960 (11)
```sql
-- VERSIONE 1
SELECT * 
FROM areoporto.passengers
WHERE date_of_birth >= '1960-01-01'
	AND date_of_birth < '1961-01-01';

-- VERSIONE 2
SELECT * 
FROM areoporto.passengers
WHERE date_of_birth BETWEEN '1960-01-01' AND '1961-01-01';
```

**BONUS** 
11. contare tutti gli aeroporti la cui città inizia per 'East' (7)
```sql
SELECT COUNT(*)
FROM areoporto.airports
WHERE city LIKE 'east%';
```

12. Contare quanti voli sono partiti il 4 luglio 2019 (3)
```sql
SELECT * 
FROM flights
WHERE DATE(departure_datetime) = '2019-07-04'
```

#### Query con group by
1. Contare quanti lavori di manutenzione ha eseguito ogni impiegato (dell'impiegato vogliamo solo l'ID) (1136)
```sql
SELECT employee_id, COUNT(*)
FROM employee_maintenance_work
GROUP BY employee_id
-- LIMIT 10000
```
*N.B.*: spesso i gestori di DB impongono un limite attorno alle *1000* come risultato finale; per ottenere quelle successive e' sufficiente impostare manualmente un limite superiore al numero di risultati attesi (es: 10.000)

2. Contare quante volte ogni impiegato ha lasciato una compagnia aerea (non mostrare quelli che non hanno mai lasciato; dell'impiegato vogliamo solo l'ID) (8939)
```sql

```

3. Contare per ogni volo il numero di passeggeri (del volo vogliamo solo l'ID) (1000)
```sql

```

4. Ordinare gli aerei per numero di manutenzioni ricevute (da quello che ne ha di piu'; dell'aereo vogliamo solo l'ID) (100)
```sql

```

5. Contare quanti passeggeri sono nati nello stesso anno (61)
```sql

```

6. Contare quanti voli ci sono stati ogni anno (tenendo conto della data di partenza) (11)
```sql

```

**BONUS** 
7. Per ogni manufacturer, trovare l'aereo con maggior numero di posti a sedere (8)
```sql

```

8. Contare quante manutenzioni ha ricevuto ciascun aereo nel 2021 (dell'aereo vogliamo solo l'ID) (36)
```sql

```

9. Selezionare gli impiegati che non hanno mai cambiato compagnia aerea per cui lavorano (1061)
```sql

```

#### Query con join
1. Selezionare tutti i passeggeri del volo 70021493-2 (85)
```sql

```

2. Selezionare i voli presi da 'Shirley Stokes' (61)
```sql

```

3. Selezionare tutti i passeggeri che hanno usato come documento 
'Passport'(775)
```sql

```

4. Selezionare tutti i voli con i relativi passeggeri (65296)
```sql

```

5. Selezionare tutti i voli che partono da 'Charleneland' e arrivano a 'Mauricestad' (3)
```sql

```

6. Selezionare tutti gli id dei voli che hanno almeno un passeggero il cui cognome inizia con 'L' (966)
```sql

```

7. Selezionare i dati delle compagnie dove almeno un impiegato si è stato licenziato (286)
```sql

```

8. Selezionare tutti gli aerei che sono partiti almeno una volta dalla città di 'Domingochester' (12)
```sql

```

9. Selezionare i dati dei tecnici e gli aerei ai quali questi hanno fatto almeno un intervento di manutenzione (1506)
```sql

```

10. Selezionare tutti i piloti che hanno viaggiato nel 2021 verso l'aeroporto di 'Abshireland' (5)
```sql

```

**BONUS** 
11. Selezionare i dati di tutti i passeggeri che hanno volato su un qualche aereo riparato da 'Aaliyah Leannon' (590)
```sql

```

12. Contare quanti piloti ha la compagnia 'Maldivian (Q2)' (10)
```sql

```

13. Contare quanti dipendenti ha ogni compagnia aerea (286)
```sql

```
