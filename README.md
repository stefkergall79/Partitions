# Raccourcis
Pour supprimer les fichiers compilés si le dépôt est placé dans le dossier personnel, dans un terminal, entrez la commande :
```bash
nano ~/.bashrc 
```
et collez à la fin du fichier ceci :
```bash
export ly_pwd=~/Partitions/
alias ly-wash='find "$ly_pwd" -not -path "*/Grégorien/*" -type f \( -name "*.pdf" -o -name "*.mid*" \) -print -delete'
alias ly-save='cd "$ly_pwd" && git add . && git commit -a -m "Sauvegarde" && git push'
```
`Ctrl+O` puis `Entrée` pour enregistrer, puis `Ctrl+X` pour sortir.
Si vous devez l'utilisez tout de suite, entrez la commande :
```bash
source ~/bashrc
```

Désormais, pour supprimer tous les fichiers compilés, entrez simplement la commande :
```bash
ly-wash
```
Et pour sauvegarder vos modifications :
```bash
ly-save
```
