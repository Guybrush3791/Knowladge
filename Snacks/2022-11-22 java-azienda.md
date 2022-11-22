#### Repo
-- nessuna --

#### Package 
-ragionevole-

#### Todo
Definire le seguenti classi:

##### Person
Classe *astratta* con i seguenti attributi:
- name : String
- surname : String
- date of birth : LocalDate
- codice aziendale : String : valore casuale di 5 cifre

Definire:
- costruttore che prende in ingresso tutti i dati (codice aziendale calcolato casualmente)
- proprieta' getter/setter
- toString (sensato)

Definire come metodo concreto:
```java
public String getFullName() // restituisce "nome cognome (codice aziendale)"
```

Definire inoltre come metodo astratto:
```java
public int getYearIncome();
```

##### Employee
Classe *concreta* che esetende la classe **Person**, aggiungendo i seguenti attributi:
- salary : int
- monthlyCount : int

Definire:
- costruttore
- proprieta' getter/setter
- toString (sensato, sfruttando il toString di *Person*)

Definisce come *incasso annuale*: salary * monthlyCount

##### Boss
Classe *concreta* che esetende la classe **Person**, aggiungendo i seguenti attributi:
- salary : int
- bonsu: int

Definire:
- costruttore
- proprieta' getter/setter
- toString (sensato, sfruttando il toString di *Person*)

Definisce come *incasso annuale*: salary * 12 + bonus


##### Main
All'interno del `main` definire un array di 5 elementi di cui 3 `Employee` e 2 `Boss` e ricavare i seguenti elementi (di tipo `Person`):
- la persona con incasso annuale *massimo*
- la persona con incasso annuale *minimo*

Ricavare inoltre le seguenti informazioni:
- trovare il costo annuale dell'intera azienda 
- trovare il costo medio per ogni dipendente (`Boss` compresi)

###### Bonus
- Trovare il `Boss` con l'incasso annuale maggiore
- Trovare l'`Employee` con l'incasso annuale minore