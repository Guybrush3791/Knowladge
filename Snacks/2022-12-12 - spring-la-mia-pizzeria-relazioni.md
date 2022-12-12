### Repo
**spring-la-mia-pizzeria-relazioni**
#### N.B.: mantenere lo stesso codice, da pushare su repo diversa


### Package
-ragionevole-

### Todo
#### Parte 1
All'interno del progetto della settimana scorsa, generare una nuova entita' chiamta `Promozione` che sara' caratterizzata da:
- *dataInizio* : LocalDate : not null
- *dataFine* : LocalDate : not null
- *titolo* : string : not null : unique

Dopo aver testata l'entita' pura (con relativi *repo* + *service*), creare la relazione tra `Pizza` e `Promozione` di tipo *1aN* (per ogni pizza esiste una sola promozione, ogni promozione puo' essere applicata a piu' pizze).
Dopo aver aggiustato i `pojo` con relative proprieta' e modifica del costruttore, all'interno dell'`Application` gestire la relazione testando la possibilita' di creare pizze con o senza promozione, e la possibilita' di eliminare sia le pizze, sia le promozioni (attenzione a come viene gestita la relazione in fase di cancellazione delle promozioni).

#### N.B.:
Attenzione ai nuovi metodi dei `Service`, che dovranno gestire se/quando la relazione verra' caricata all'interno della lista (vedere metodo `@Transactional` dell'esempio visto in classe)