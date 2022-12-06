
### Repo
**spring-la-mia-pizzeria-crud**

### Package
-ragionevole-

### Todo
All'interno dello stesso progetto dell'esercizio precedente, aggiungere la seguente entita' e svolgere il necessario per attivare la CRUD completa:

#### Drink
- name : String : not null : unique
- description : String : log : nullable
- price : int : not null : > 0

Andranno quindi creati i 3 file per l'entita' (Entity, Repository e Service) e poi create tutte le rotte nessarie in un nuovo controller di nome *DrinkController* basato sulla rotta `/drink` (`@RequestMapping` del *controller*).