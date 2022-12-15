### Repo
**spring-la-mia-pizzeria-relazioni**

### Package
-ragionevole-

### Todo
#### Parte 1
Nell'esercizio precedente aggiungere l'entita' `Ingrediente` (con relativi *repo* + *service*). La nuova entita' sara' carraterizzata da:
- nome : String : not null

Testare la nuova entita' nel `run()` e poi aggiungere una relazione di tipo **ManyToMany** tra `Ingrediente` e `Pizza` (per ogni ingrediente esistono piu' pizze, per ogni pizza esistono piu' ingredienti). Testare all'interno del `run()` anche la relazione appena creata.

Aggiungere inoltre un controller dedicato alla nuova entita' `IngredienteController` che sara' in grado di mostrare attraverso le pagine `HTML` la lista di ingredienti con le relative pizze associate. Dovra' inoltre essere fornita all'utente la possibilita' di inserire nuovi ingredienti associati alle pizze e di creare nuove pizze associando gli ingredienti.

#### Parte2
Fornire la possibilita' di eliminare entita', e modificare le entita' presenti (sia `Ingrediente` che `Pizza`) valorizzando correttamente sia in lettura che in scrittura le relazioni.