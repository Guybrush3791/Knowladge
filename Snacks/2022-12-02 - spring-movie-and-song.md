### Repo
**???**

### Todo

#### Parte 1
In progetto nuovo di tipo *Spring*, eseguire i seguenti task:
1. Creare un totale di 3 pagine con relative rotte:
	1. pagina con solo i link a `/best-song` e `/best-movie` con il presente layout
![[Pasted image 20221202120723.png]]
		2. nella pagina `/best-movie` stampare una serie di `Movie` con il seguente layout
![[Pasted image 20221202120830.png]]
		3. nella pagina `/best-song` rricalcare il layout del punto 2
2. La provienza dei dati per stampare `Song` e `Movie` dovra' essere il **controller** che andra' a creare una lista di oggetti (*fake*) da mandare al *front-end*
3. La struttura delle 2 classi composta da un `id` di tipo `intero` e un `text` di tipo `String`, sara' definita in un *package* dedicato (es: `org.generation.italy.demo.pojo`)

**BONUS**
4. Per stampare gli elementi di `Song` e `Movie` utilizzare dei *fragment*

#### Parte 2
1. Spostare la definizione dei dati *fake* del db in metodi *privati* e *statici*
2. Generare una pagina dedicata alla visualizzazione di un singolo *film* con rotta del tipo `/best-movie/{id}` che stampera' solo i dettagli dell'emento selezionato dall'`id` nell'`url`
3. Sostituire i testi nelle liste  con dei link che portano alla pagina del dettaglio dell'elemento

**Bonus**
1. Replicare la stessa logica anche per le canzoni (`Song`)