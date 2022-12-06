
### Repo
**spring-la-mia-pizzeria-crud**

### Package
-ragionevole-

### Todo
All'interno dello stesso progetto dell'esercizio precedente, aggiungere la seguente entita' e svolgere il necessario per attivare la CRUD completa:

#### Drink
- name : String : not null : unique
- description : String : lob : nullable
- price : int : not null : > 0

Andranno quindi creati i 3 file per l'entita' (Entity, Repository e Service) e poi create tutte le rotte nessarie in un nuovo controller di nome *DrinkController* basato sulla rotta `/drink` (`@RequestMapping` del *controller*).

---

#### Bonus
Introdurre il concetto di errore + validazione + ritorno messaggio prima per l'entita' `Pizza` e poi eventualmente per i `Drink`

##### Hint
Snippet per controllo errori + gestione messaggi redirect

**Controller**
```java
@PostMapping("/create")
	public String getStoreDrink(@Valid Drink drink, 
			BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if (bindingResult.hasErrors()) {
			
			System.err.println("ERROR ------------------------------------------");
			System.err.println(bindingResult.getAllErrors());
			System.err.println("------------------------------------------------");
			
			redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
			
			return "redirect:/drink/create";
		}
		
		drinkServ.save(drink);
		
		return "redirect:/drink";
	}
```

**HTML (create)**
```html
<div
		th:if="${errors}"
	>
		ERROR:<br>
		<ul>
			<li
				th:each="error : ${errors}"
				th:object="${error}"
			>
				[[*{defaultMessage}]]
			</li>
		</ul>
	</div>
```