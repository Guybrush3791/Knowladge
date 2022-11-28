### Milestone 4
- definire metodo `equals` di `Evento`: un evento e' uguale ad un altro se ha lo stesso titolo e e' nella stessa data
- generare classe `ProgrammaEventiUnici` con `Set<Evento>` al posto della lista; generare tutti i metodo fatti in `ProgrammaEventi` con la nuova struttura dati
- all'interno della classe `ProgrammaEventiUnici` definire i seguenti metodi:
	- `getMaxPostiTotaliEvento`: restituisce l'evento con il numero *massimo* di posti totali
	- `getMinPostiTotaliEvento`: restituisce l'evento con il numero *minimo* di posti totali
	- `orderedPrint`: stampa tutti gli eventi in ordine di lunghezza del titolo (titolo piu' lungo prima)
	- `getFirstEvent`: restituisce il primo evento in ordine temporale (senza ordinare la lista; usare i *comparatori*)
	- `getLastEvent`: restituisce l'ultimo evento in ordine temporale (senza ordinare la lista; usare i *comparatori*)