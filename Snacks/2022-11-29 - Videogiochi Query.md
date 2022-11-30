## Repo
db-videogames-query

### Schema E-R
![[Pasted image 20221129162923.png]]

### Query
Dopo aver importato il dump del db contenente i dati ([[Videogiochi DB]]), eseguire le seguenti query:
#### SELECT
1. Selezionare tutte le software house americane (3)
```sql
SELECT * 
FROM videogame.software_houses
WHERE country LIKE 'United States'
```

3. Selezionare tutti i giocatori della cittÃ  di 'Rogahnland' (2)
```sql
SELECT * 
FROM players
WHERE city LIKE 'Rogahnland'
```

4. Selezionare tutti i giocatori il cui nome finisce per "a" (220)
```sql
SELECT * 
FROM players
WHERE name LIKE '%a'
```

5. Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
```sql
SELECT * 
FROM videogame.reviews
WHERE player_id = 800
```

6. Contare quanti tornei ci sono stati nell'anno 2015 (9)
```sql
SELECT * 
FROM videogame.tournaments
WHERE year = 2015
```

7. Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
```sql
SELECT * 
FROM videogame.awards
WHERE description LIKE '%facere%'
```

8. Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
```sql
SELECT DISTINCT videogame_id
FROM category_videogame
WHERE category_id = 2 OR category_id = 6
```

9. Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
```sql
-- VERSIONE 1
SELECT * 
FROM videogame.reviews
WHERE rating >= 2 AND rating <= 4

-- VERSIONE 2
SELECT * 
FROM videogame.reviews
WHERE rating BETWEEN 2 AND 4
```

10. Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
```sql
SELECT * 
FROM videogame.videogames
WHERE YEAR(release_date) = 2020
```

11. Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)
```sql
SELECT DISTINCT videogame_id
FROM videogame.reviews
WHERE rating = 5
```

##### **BONUS**
11. Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3.16 circa)
```sql
SELECT COUNT(*), AVG(rating)
FROM videogame.reviews
WHERE videogame_id = 412
```

13. Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13)
```sql
SELECT * 
FROM videogame.videogames
WHERE software_house_id = 1
	AND YEAR(release_date) = 2018
```


---

#### GROUP BY
1. Contare quante software house ci sono per ogni paese (3)
```sql
SELECT country, COUNT(*)
FROM videogame.software_houses
GROUP BY country;
```

2. Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
```sql
SELECT videogame_id, COUNT(*)
FROM videogame.reviews
GROUP BY videogame_id
```

3. Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
```sql
SELECT pegi_label_id, COUNT(*)
FROM videogame.pegi_label_videogame
GROUP BY pegi_label_id
```

4. Mostrare il numero di videogiochi rilasciati ogni anno (11)
```sql
SELECT YEAR(release_date), COUNT(*)
FROM videogame.videogames
GROUP BY YEAR(release_date)
```

5. Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
```sql
SELECT device_id, COUNT(*)
FROM videogame.device_videogame
GROUP BY device_id
```

6. Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
```sql
SELECT videogame_id, AVG(rating) AS 'avgRating'
FROM videogame.reviews
GROUP BY videogame_id
ORDER BY avgRating DESC
```


---

#### JOIN
1. Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
```sql
SELECT DISTINCT players.id, players.*
FROM reviews
	JOIN players
		ON reviews.player_id = players.id
```

2. Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
```sql
SELECT DISTINCT videogames.*
FROM tournaments
	JOIN tournament_videogame
		ON tournaments.id = tournament_videogame.tournament_id
	JOIN videogames
		ON tournament_videogame.videogame_id = videogames.id
WHERE year = 2016
```

3. Mostrare le categorie di ogni videogioco (1718)
```sql
SELECT videogames.id, videogames.name, categories.name
FROM videogames
	JOIN category_videogame
		ON videogames.id = category_videogame.videogame_id
	JOIN categories
		ON category_videogame.category_id = categories.id
ORDER BY videogames.id -- OPZIONALE
```

4. Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
```sql
SELECT DISTINCT software_houses.*
FROM videogames
	JOIN software_houses
		ON videogames.software_house_id = software_houses.id
WHERE YEAR(release_date) > 2020
```

5. Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
```sql
SELECT software_houses.id, software_houses.name, awards.name, videogames.name, award_videogame.year
FROM awards
	JOIN award_videogame
		ON awards.id = award_videogame.award_id
	JOIN videogames
		ON award_videogame.videogame_id = videogames.id
	JOIN software_houses
		ON videogames.software_house_id = software_houses.id
ORDER BY software_houses.id, year -- OPZIONALE
```

6. Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)
```sql
SELECT DISTINCT videogames.id, videogames.name, pegi_labels.name, categories.name
FROM videogame.videogames
	JOIN reviews
		ON videogames.id = reviews.videogame_id
	JOIN pegi_label_videogame
		ON videogames.id = pegi_label_videogame.videogame_id
	JOIN pegi_labels
		ON pegi_label_videogame.pegi_label_id = pegi_labels.id
	JOIN category_videogame
		ON videogames.id = category_videogame.videogame_id
	JOIN categories
		ON category_videogame.category_id = categories.id
WHERE reviews.rating >= 4
ORDER BY videogames.id, pegi_labels.name, categories.name -- OPZIONALE
```

7. Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)
```sql
SELECT DISTINCT videogames.*
FROM players
	JOIN player_tournament
		ON players.id = player_tournament.player_id
	JOIN tournaments
		ON player_tournament.tournament_id = tournaments.id
	JOIN tournament_videogame
		ON tournaments.id = tournament_videogame.tournament_id
	JOIN videogames
		ON tournament_videogame.videogame_id = videogames.id
WHERE players.name LIKE 's%'
```

8. Selezionare le citta'  in cui e' stato giocato *il gioco dell'anno* (award) del 2018 (36)
```sql
SELECT awards.id, awards.name, award_videogame.year, videogames.id, videogames.name, tournaments.name, tournaments.city
FROM awards
	JOIN award_videogame
		ON awards.id = award_videogame.award_id
	JOIN videogames
		ON award_videogame.videogame_id = videogames.id
	JOIN tournament_videogame
		ON videogames.id = tournament_videogame.videogame_id
	JOIN tournaments
		ON tournament_videogame.tournament_id = tournaments.id
WHERE awards.name LIKE "Gioco dell'anno"
	AND award_videogame.year = 2018
```

9. Selezionare i giocatori che hanno giocato al gioco piu' atteso del 2018 in un torneo del 2019 (3306)
```sql
SELECT tournaments.id, tournaments.name, tournaments.year, players.name, players.lastname, players.nickname
FROM awards
	JOIN award_videogame
		ON awards.id = award_videogame.award_id
	JOIN videogames
		ON award_videogame.videogame_id = videogames.id
	JOIN tournament_videogame
		ON videogames.id = tournament_videogame.videogame_id
	JOIN tournaments
		ON tournament_videogame.tournament_id = tournaments.id
	JOIN player_tournament
		ON tournaments.id = player_tournament.tournament_id
	JOIN players
		ON player_tournament.player_id = players.id
WHERE awards.name LIKE "Gioco più atteso"
	AND award_videogame.year = 2018
    AND tournaments.year = 2019
```


##### **BONUS**
10. Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)
```sql
SELECT software_houses.*, videogames.*
FROM videogames
	JOIN software_houses
		ON videogames.software_house_id = software_houses.id
ORDER BY release_date
LIMIT 1;
```

11. Selezionare i dati del videogame (id, name, release_date, totale recensioni) con piu' recensioni (videogame id : potrebbe uscire 449 o 398, sono entrambi a 20)
```sql
-- VERSIONE BASE
SELECT videogames.id, videogames.name, COUNT(reviews.id) AS 'revCount'
FROM videogames
	JOIN reviews
		ON videogames.id = reviews.videogame_id
GROUP BY videogames.id
ORDER BY revCount DESC
LIMIT 1;

-- VERSIONE ADVANCED
SELECT videogames.id, videogames.name, COUNT(reviews.id) AS 'revCount'
FROM videogames
	JOIN reviews
		ON videogames.id = reviews.videogame_id
GROUP BY videogames.id
HAVING revCount = (
	SELECT COUNT(reviews.id) AS 'revCount'
	FROM videogames
		JOIN reviews
			ON videogames.id = reviews.videogame_id
	GROUP BY videogames.id
	ORDER BY revCount DESC
	LIMIT 1
)
```

12. Selezionare la software house che ha vinto piu' premi tra il 2015 e il 2016 (software house id : potrebbe uscire 3 o 1, sono entrambi a 3)
```sql
-- VERSIONE BASE
SELECT software_houses.id, software_houses.name, COUNT(*) AS 'awaCount'
FROM software_houses
	JOIN videogames
		ON software_houses.id = videogames.software_house_id
	JOIN award_videogame
		ON videogames.id = award_videogame.videogame_id
WHERE award_videogame.year BETWEEN 2015 AND 2016
GROUP BY software_houses.id
ORDER BY awaCount DESC
LIMIT 1

-- VERSIONE ADVANCED
SELECT software_houses.id, software_houses.name, COUNT(*) AS 'awaCount'
FROM software_houses
	JOIN videogames
		ON software_houses.id = videogames.software_house_id
	JOIN award_videogame
		ON videogames.id = award_videogame.videogame_id
WHERE award_videogame.year BETWEEN 2015 AND 2016
GROUP BY software_houses.id
HAVING awaCount = (
	SELECT COUNT(*) AS 'awaCount'
	FROM software_houses
		JOIN videogames
			ON software_houses.id = videogames.software_house_id
		JOIN award_videogame
			ON videogames.id = award_videogame.videogame_id
	WHERE award_videogame.year BETWEEN 2015 AND 2016
	GROUP BY software_houses.id
	ORDER BY awaCount DESC
	LIMIT 1
)
```

13. Selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 1.5 (1. Adventure)
```sql
SELECT categories.*
FROM videogames
	JOIN reviews
		ON videogames.id = reviews.videogame_id
	JOIN category_videogame
		ON videogames.id = category_videogame.videogame_id
	JOIN categories
		ON category_videogame.category_id = categories.id
GROUP BY videogames.id
HAVING AVG(reviews.rating) < 1.5
```
