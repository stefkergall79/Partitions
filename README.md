# Raccourcis
Pour supprimer les fichiers compilés si le dépôt est placé dans le dossier personnel, dans un terminal, entrez la commande :
```bash
nano ~/.bashrc 
```
et collez à la fin du fichier ceci :
```bash
alias ly-pwd = ~/Partitions/
alias wash-ly='find ly-pwd -not -path "*/Grégorien/*" -type f \( -name "*.pdf" -o -name "*.mid*" \) -print -delete'
alias save-ly='cd ly-pwd && git add . && git commit -a -m "Sauvegarde" && git push'
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
Et pour sauvegarder vos modifications :
```bash
save-ly
```
