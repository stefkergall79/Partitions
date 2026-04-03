Pour supprimer les fichiers compilés si le dépôt est placé dans le dossier personnel, dans un terminal, entrez la commande :
```bash
nano ~/.bashrc 
```
et collez à la fin du fichier ceci :
```bash
alias wash-ly='find ~/Partitions/ -type f \( -name "*.pdf" -o -name "*.midi" \) -delete'
```
`Ctrl+O` puis `Entrée` pour enregistrer, puis `Ctrl+X` pour sortir.
Si vous devez l'utilisez tout de suite, entrez la commande :
```bash
source ~/bashrc
```

Désormais, pour supprimer tous les fichiers compilés, entrez simplement la commande :
```bash
wash-ly
```
