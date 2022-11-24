# HowTo: caricare nuovo progetto da terminale

## Da fare solo la prima volta
### Creare nuova chiave ssh
Per creare una coppia di chiavi pubblica-privata lanciare questo comando:
```sh-session
ssh-keygen -t ed25519 -C "mia@mail.com"
```

In uscita sara' possibile vedere il percorso della chiave privata e di quella pubblica (`.pub`)
```sh-session
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/guybrush/.ssh/id_ed25519): 
Created directory '/home/guybrush/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/guybrush/.ssh/id_ed25519
Your public key has been saved in /home/guybrush/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:9EhIGV390igJE7nu6GLOfSWacdfGc3z8e4Z3jloIRkQ totani8775@lance7.com
The key's randomart image is:
+--[ED25519 256]--+
|      o+.=E.     |
|     ...=.  .    |
|      . o+.. +   |
|       o.+o o o  |
|       .S ++ o . |
|      . +.o.=.o o|
|       B + ..o.o.|
|   .o.+ o    ...*|
|   oooo.    ...==|
+----[SHA256]-----+
```

### Caricare la chiave pubblica su GitHub
Attraverso il menu a tendina in alto a dx aprire le impostazioni e dirigersi alla voce `SSH and GPG keys` e caricare la chiave pubblica nella sezione `SSH Keys` attraverso il tasto verde:
![[Pasted image 20221114163454.png]]

Copiare il contenuto del file `.pub` generato in precedenza nella box `key`:
![[Pasted image 20221114163734.png]]

## Da fare per ogni nuovo repository creato
### Creare nuovo repository
Utilizzare l'home-page di GitHub per creare un nuovo repository, ed entrarvici:
![[Pasted image 20221114164005.png]]


### Seguire le istruzioni da riga di comando suggerite da GitHub
*Entrare nella cartella principale del progetto* e digitare i seguenti comandi avendo cura di cambiare l'url del repository e account (`git@github.com:Guybrush19731973/test1.git`)

```sh-session
git init # inizializza repository
git add ./* # aggiunge tutti i file presenti nella cartella alla repo
git commit -m "first commit" # genera commit complessivo
git branch -M main # genera branch main
git remote add origin git@github.com:Guybrush19731973/test1.git # aggiunge origine repo
git push -u origin main # push di tutte le modifiche in coda
```

L'ultima operazione manda effettivamente i dati sul repository remoto:
```sh-session
The authenticity of host 'github.com (140.82.121.4)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Enumerating objects: 12, done.
Counting objects: 100% (12/12), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (12/12), 1.63 KiB | 1.63 MiB/s, done.
Total 12 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:Guybrush19731973/test1.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
```

## Da fare ad ogni push
Per caricare sul repository le modifiche fatte ad una repo esistente eseguire i seguenti comandi:
```sh-session
git add ./*
git commit -m "second commit"
git push -u origin main
```

Attenzioni in caso di errori, controllare sempre l'output dei comandi da termianle:
```sh-session
Enumerating objects: 21, done.
Counting objects: 100% (21/21), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (12/12), 718 bytes | 718.00 KiB/s, done.
Total 12 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:Guybrush19731973/test1.git
   e259b98..c365833  main -> main
branch 'main' set up to track 'origin/main'.
```