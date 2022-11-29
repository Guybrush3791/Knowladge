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

##### **BONUS** 
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
SELECT employee_id, COUNT(*)
FROM airline_employee
WHERE layoff_date IS NOT NULL
GROUP BY employee_id
```

3. Contare per ogni volo il numero di passeggeri (del volo vogliamo solo l'ID) (1000)
```sql
SELECT flight_id, COUNT(*)
FROM flight_passenger
GROUP BY flight_id
```

4. Ordinare gli aerei per numero di manutenzioni ricevute (da quello che ne ha di piu'; dell'aereo vogliamo solo l'ID) (100)
```sql
SELECT airplane_id, COUNT(*) AS 'mantenanceCount'
FROM maintenance_works
GROUP BY airplane_id
ORDER BY mantenanceCount DESC
```

5. Contare quanti passeggeri sono nati nello stesso anno (61)
```sql
SELECT YEAR(date_of_birth), COUNT(*)
FROM areoporto.passengers
GROUP BY YEAR(date_of_birth)
```

6. Contare quanti voli ci sono stati ogni anno (tenendo conto della data di partenza) (11)
```sql
SELECT YEAR(departure_datetime), COUNT(*)
FROM areoporto.flights
GROUP BY YEAR(departure_datetime)
```

##### **BONUS** 
7. Per ogni manufacturer, trovare il numero massimo di posti disponibili in un solo aereo (8)
```sql
SELECT manufacturer, MAX(seating_capacity)
FROM areoporto.airplanes
GROUP BY manufacturer
```

8. Contare quante manutenzioni ha ricevuto ciascun aereo nel 2021 (dell'aereo vogliamo solo l'ID) (36)
```sql
SELECT airplane_id, COUNT(*)
FROM areoporto.maintenance_works
WHERE YEAR(datetime) = 2021
GROUP BY airplane_id
```

9. Selezionare gli impiegati che non hanno mai cambiato compagnia aerea per cui lavorano (1061)
```sql
SELECT employee_id
FROM areoporto.airline_employee
WHERE layoff_date IS NULL;
```

#### Query con join
1. Selezionare tutti i passeggeri del volo 70021493-2 (85)
```sql
SELECT passengers.*
FROM flights
	JOIN flight_passenger
		ON flights.id = flight_passenger.flight_id
	JOIN passengers
		ON flight_passenger.passenger_id = passengers.id
WHERE number LIKE '70021493-2'
```

2. Selezionare i voli presi da 'Shirley Stokes' (61)
```sql
SELECT flights.*
FROM passengers
	JOIN flight_passenger
		ON passengers.id = flight_passenger.passenger_id
	JOIN flights
		ON flight_passenger.flight_id = flights.id
WHERE name LIKE 'Shirley' 
	AND lastname LIKE 'Stokes'
```

3. Selezionare tutti i passeggeri che hanno usato come documento 
'Passport'(775)
```sql
SELECT passengers.*, document_types.name
FROM passengers
	JOIN document_type_passenger
		ON passengers.id = document_type_passenger.passenger_id
	JOIN document_types
		ON document_type_passenger.document_type_id = document_types.id
WHERE document_types.name LIKE 'Passport'
```

4. Selezionare tutti i voli con i relativi passeggeri (65296)
```sql
SELECT DISTINCT passengers.id, passengers.*
FROM passengers
	INNER JOIN document_type_passenger
		ON passengers.id = document_type_passenger.passenger_id
	INNER JOIN document_types
		ON document_type_passenger.document_type_id = document_types.id
WHERE document_types.name LIKE 'Passport'
```

5. Selezionare tutti i voli che partono da 'Charleneland' e arrivano a 'Mauricestad' (3)
```sql
SELECT flights.*, dep.city AS 'departure_city', arr.city AS 'arrival_city'
FROM flights
	JOIN airports AS dep
		ON flights.departure_airport_id = dep.id
	JOIN airports AS arr
		ON flights.arrival_airport_id = arr.id
WHERE dep.city LIKE 'Charleneland'
	AND arr.city LIKE 'Mauricestad'
```

6. Selezionare tutti gli id dei voli che hanno almeno un passeggero il cui cognome inizia con 'L' (935)
```sql
SELECT DISTINCT flight_passenger.flight_id
FROM flight_passenger
	JOIN passengers
		ON flight_passenger.passenger_id = passengers.id
WHERE passengers.lastname LIKE 'l%'
```

7. Selezionare i dati delle compagnie dove almeno un impiegato si è licenziato (286)
```sql
SELECT airlines.*
FROM areoporto.airline_employee
	JOIN airlines
		ON airline_employee.airline_id = airlines.id
WHERE layoff_date IS NOT NULL
GROUP BY airlines.id
```

8. Selezionare tutti gli aerei che sono partiti almeno una volta dalla città di 'Domingochester' (12)
```sql
SELECT airplanes.*
FROM airplanes
	JOIN flights
		ON airplanes.id = flights.airplane_id
	JOIN airports
		ON flights.departure_airport_id = airports.id
WHERE airports.city LIKE 'Domingochester'
```

9. Selezionare i dati dei tecnici e gli aerei ai quali questi hanno fatto almeno un intervento di manutenzione (1506)
```sql
SELECT employees.*, airplanes.*
FROM employees
	JOIN roles
		ON employees.role_id = roles.id
	JOIN employee_maintenance_work
		ON employees.id = employee_maintenance_work.employee_id
	JOIN maintenance_works
		ON employee_maintenance_work.maintenance_work_id = maintenance_works.id
	JOIN airplanes
		ON maintenance_works.airplane_id = airplanes.id
WHERE roles.name LIKE 'Technician'
```

10. Selezionare tutti i piloti che hanno viaggiato nel 2021 dall'aeroporto di 'Abshireland' (4)
```sql
SELECT employees.*
FROM airports
	JOIN flights
		ON airports.id = flights.departure_airport_id
	JOIN employee_flight
		ON flights.id = employee_flight.flight_id
	JOIN employees
		ON employee_flight.employee_id = employees.id
	JOIN roles
		ON employees.role_id = roles.id
WHERE airports.city LIKE 'Abshireland'
	AND roles.name LIKE 'pilot'
    AND YEAR(flights.departure_datetime) = 2021
```

##### **BONUS** 
11. Selezionare i dati di tutti i passeggeri che hanno volato su un qualche aereo riparato da 'Aaliyah Leannon' (590)
```sql
SELECT DISTINCT passengers.id, passengers.name, passengers.lastname
FROM employees
	JOIN employee_maintenance_work
		ON employees.id = employee_maintenance_work.employee_id
	JOIN maintenance_works
		ON employee_maintenance_work.maintenance_work_id = maintenance_works.id
	JOIN airplanes
		ON maintenance_works.airplane_id = airplanes.id
	JOIN flights
		ON airplanes.id = flights.airplane_id
	JOIN flight_passenger
		ON flights.id = flight_passenger.flight_id
	JOIN passengers
		ON flight_passenger.passenger_id = passengers.id
WHERE employees.name LIKE 'Aaliyah'
	AND employees.lastname LIKE 'Leannon'
```

12. Contare quanti piloti ha la compagnia 'Maldivian (Q2)' (10)
```sql
SELECT airlines.name, COUNT(*)
FROM airlines
	JOIN airline_employee
		ON airlines.id = airline_employee.airline_id
	JOIN employees
		ON airline_employee.employee_id = employees.id
	JOIN roles
		ON employees.role_id = roles.id
WHERE airlines.name LIKE 'Maldivian (Q2)'
		AND roles.name LIKE 'pilot'
        AND airline_employee.layoff_date IS NULL
GROUP BY airlines.code;
```

13. Contare quanti dipendenti ha ogni compagnia aerea (286)
```sql
SELECT airlines.id, airlines.code, airlines.name, COUNT(*)
FROM airlines
	JOIN airline_employee
		ON airlines.id = airline_employee.airline_id
WHERE airline_employee.layoff_date IS NULL
GROUP BY airlines.code
```
