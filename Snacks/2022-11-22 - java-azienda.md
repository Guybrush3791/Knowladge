## Repo
`abstract-animals`

### ES 1

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
- bonus: int

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

---

### ES2

#### Package 
org.abstract.animals

#### Todo
Dobbiamo realizzare un programma che rappresenti il regno animale.

Creiamo quindi una classe astratta *Animale* e delle classi che la estendono : *Cane*, *Passerotto*, *Aquila*, *Delfino*

Vogliamo che gli animali abbiano i seguenti metodi
- `void dormi()`: mostra a video “Zzz”
- `void verso()`: mostra a video il verso fatto dall'animale specifico
- `void mangia()`: mostra a video quello che mangia : erba, carne, ...?

Quali di questi metodi devono essere implementati nella classe astratta e quali devono essere lasciati astratti e implementati dalle classi che la estendono?

Una volta create le classi, nel programma istanziare alcuni animali e utilizzare i metodi implementati nel `main`.

---

Alcuni degli animali che abbiamo creato volano, altri nuotano. Definire e implementare un interfaccia che esponga i seguenti metodi:
##### IVolante
- `void vola()`: mostra a video *“Sto volando!!!”*
##### INuotante
- `void nuota()`: mostra a video *“Sto nuotando!!!”*

Scrivere un programma avente oltre al `main` 2 metodi *statici*:
- `static void faiVolare(IVolante animale)`
- `static void faiNuotare(INuotante animale)`

Questi metodi prendono come parametro un animale che può o volare / nuotare e richiamano il corrispondente metodo `vola()`/`nuota()`.

Scrivere un programma che istanzi animali che volano o nuotano e richiamare i metodi `faiVolare()`/`faiNuotare()` passandoglieli come parametro.

Buon lavoro! :)