
### Repo
**spring-la-mia-pizzeria-crud**

### Package
-ragionevole-

### Todo
In aggiunta all'esercizio precedente (sulla stessa *repo*) aggiungere una rotta per la ricerca di `Drink` e una per la ricerca di `Pizza`, come visto in classe.

Per la ricerca utilizzare le *Named Query* basandosi su questo [link](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation) per la costruzione dei metodi all'interno dei *repositories*.

Si veda snippet di codice allegato per la gestione della search e dei *parametri in ingresso* (metodo `GET`) lato *java* + lato *HTML*:

**Controller**
```java
	@GetMapping("/search")
	public String getSearchDrinkByName(Model model, 
			@RequestParam(name = "q", required = false) String query) {
		
//		List<Drink> drinks = null;
//		if (query == null) {
//			
//			drinks = drinkServ.findAll();
//			
//		} else {
//			
//			drinks = drinkServ.findByName(query);
//		}
		List<Drink> drinks = query == null 
							? drinkServ.findAll()
							: drinkServ.findByName(query); 
		
		model.addAttribute("drinks", drinks);
		model.addAttribute("query", query);
		
		return "drink-search";
	}
```

**HTML**
```html
	<form>
		<label>Name: </label>
		<input type="text" name="q" th:value="${query}">
		<br><br>
		<input type="submit" value="SEARCH">
	</form>
```

#### Bonus
Generare una rotta per la ricerca sia su `Drink` che su `Pizza` in un unica pagina (sempre a partire dal nome).