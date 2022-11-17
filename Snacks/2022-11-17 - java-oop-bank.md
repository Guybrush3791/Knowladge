# Java Bank

#### Repo
java-oop-bank

#### Todo
Creare la classe `Conto`, caratterizzate come segue:

##### Conto
Variabili d'ambiente:
- numero conto - int
- nome proprietario - String
- saldo - int

Generare *costruttore*, *proprieta'* (getter/setter) e *toString()*.
Definire propriamente i *modificatori di visibilita'*.

Definire inoltre la classe seguendo le seguenti logiche:
- durante la fase di istanza il *saldo del conto* deve essere impostato a 0
- *codice del conto* e il *saldo* devono essere accessibili solo in lettura (omettere le opportune proprieta')
- *nome proprietario* accessibile sia in lettura che in scrittura

Definire inoltre i seguenti metodi:
- *addMoney* utile per versare denaro sul conto
- *getMoney* utile a prelevare denaro
- *getSaldo* ritorna il saldo utile

**DANGER**: il saldo **NON** deve mai essere negativo

##### Main
Nella classe `Main` andare a definire alcune variabili di tipo `Conto` e testare la correttezza del codice.