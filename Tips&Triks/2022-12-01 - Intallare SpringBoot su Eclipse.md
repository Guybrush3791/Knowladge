Per poter sfruttare tutte le potenzialita' di Spring e' possibile scaricare e installare una versione di *Eclipse* contenente gia' tutti i pacchietti necessari a questo [indirizzo](https://spring.io/tools#suite-three), oppure seguire i seguenti passaggi.

### Installare *Spring Boot* in *Eclipse*

1. Aprire il *Marketplace* attraverso il menu in alto `Help` --> `Eclipse Marketplace...`
![[Pasted image 20221201112517.png]]

2. Ricercare *Spring* e installare il pacchetto `Srping Boot 4 (aka Spring Tool Suite4)`
![[Pasted image 20221201112615.png]]

3. Continuare con le scelte predefinite
![[Pasted image 20221201112716.png]]

4. Accettare tutte le licenze
![[Pasted image 20221201112739.png]]

5. Attendere fino alla fine del download e dell'installazione, fino alla richiesta di riavvio da parte di *Eclipse*
![[Pasted image 20221201112816.png]]

Sara' a questo punto visibile una nuova icona nel menu in alto ![[Pasted image 20221201114435.png]] attraverso la quale sara' possibile gestire i progetti di *Spring*. E ora inoltre possibile creare nuovi progetti di tipo *Spring* attraverso il solito wizzard:
![[Pasted image 20221201114528.png]]
### Creare primo progetto di *Hello, World!*

1. Aprire il wizzard di creazione progetti e ricercare *Spring*
![[Pasted image 20221201114528.png]]

2. Dopo aver selezionato *Spring Start Project*, definire:
	- **Name**: nome progetto
	- **Type**: Maven
	- **Group**: Selezionare il package generale
	- **Package**: Selezionare un sotto-package di *Group*
![[Pasted image 20221201114952.png]]

3. E' ora possibile installare delle librerie all'interno del progetto, da cui andremo a selezionare *Spring Web*, *Thymeleaf* e *Spring Boot DevTools*
![[Pasted image 20221201115129.png]]

4. Nessuna azione, premere *Finish*
![[Pasted image 20221201115200.png]]

5. Al termine sara' possibile vedere il progetto iniziallizzato come nell'immagine sottostante
![[Pasted image 20221201115259.png]]

6. Creare ora un file di tipo *HTML* all'interno della cartella `src/main/resources/temmplates`
![[Pasted image 20221201115358.png]]

7. Definire nome del filie come `home.html`
![[Pasted image 20221201115435.png]]

8. Selezionare *New HTML File (5)*
![[Pasted image 20221201115458.png]]

9. Premere *Finish* e generare un `html` di **Hello, World!**
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello, World!!!!!!</h1>
</body>
</html>
```

10. Generare nuovo file `java` all'interno della cartella `src/main/java` usando un sotto-package del *Package* selezionato in fase di installazione, e definire come nome `MainController`
![[Pasted image 20221201115731.png]]

11. Creare lo *scaffolding* principale per restituire la pagina `HTML` appena creata:
```java
package org.generation.italy.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String getHome() {
		
		return "home"; 
	}
}
```

12. Lanciare il progetto attraverso il menu di *Boot Dashboard* selezionando il progetto e premendo l'icona rossa piu' a sx
![[Pasted image 20221201120051.png]]

13. Alla conclusione della compilazione nel terminale, aprire la pagina web in un qualsiasi browser: `localhost:8080`
![[Pasted image 20221201120218.png]]
![[Pasted image 20221201120253.png]]