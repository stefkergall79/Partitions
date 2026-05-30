import os
import shutil
from pathlib import Path
import tkinter
import customtkinter as ctk
import git

app = ctk.CTk()
app.title("Gestion des données de Lilypond")
app.geometry("550x600")

PWD = Path(__file__).resolve().parent

#----------------------------------
# Sauvegarde Git

REPO = git.Repo(PWD)

def ctk_git_label(text, bold=False):
	font = ctk.CTkFont(family="Arial", size=16, weight="bold" if bold else "normal")
	ctk.CTkLabel(liste_fichiers, text=text, font=font).pack(fill="x")

def ctk_git_status():
    # 1. On interroge Git de la manière la plus rapide qui existe (en C / natif)
    statut_brut = REPO.git.status('--porcelain')
    
    fichiers_modifies = []
    fichiers_non_suivis = []
    
    # 2. On trie le résultat texte en mémoire (ultra rapide)
    if statut_brut:
        for ligne in statut_brut.splitlines():
            if len(ligne) < 4:
                continue
            code_statut = ligne[:2]
            nom_fichier = ligne[3:]
            
            if code_statut == '??':
                fichiers_non_suivis.append(nom_fichier)
            elif code_statut in (' M', 'M ', 'MM', ' D', 'D '):
                fichiers_modifies.append(nom_fichier)
                
    # --- À partir d'ici, ton code reste le même, mais utilise les nouvelles listes ---

    if fichiers_modifies:
        ctk_git_label("Fichiers modifiés", bold=True)
        for file in fichiers_modifies:
            # Note : 'file' est déjà une chaîne de caractères (str) avec cette méthode, 
            # donc plus besoin de '.a_path'
            ctk_git_label(f"{file}") 
    
    if fichiers_non_suivis:
        ctk_git_label("\nNouveaux fichiers", bold=True)
        for file in fichiers_non_suivis:
            ctk_git_label(f"{file}")

    if not fichiers_modifies and not fichiers_non_suivis:
        ctk_git_label("Aucun changement à sauvegarder.", bold=True)
        raise git.exc.GitCommandError("git", "Rien à sauvegarder")


def ly_save():
	for widget in liste_fichiers.winfo_children():
		widget.destroy()
	
	try:
		ctk_git_status()
	except git.exc.GitCommandError:
		return

	REPO.index.commit("Modifications")
	REPO.git.add(".")
	REPO.index.commit("Sauvegarde")
	
	try:
		REPO.remote(name="origin").pull()
		REPO.remote(name="origin").push()
	
	except git.exc.GitCommandError:
		git_config = git.Git().config
		ctk_git_label("\nConfiguration de la sauvegarde nécessaire...")
		git_config("user.name", "Stéphane Kergall")
		git_config("user.email", "stef.kergall@gmail.com")

		REPO.remote(name="origin").pull()
		REPO.remote(name="origin").push()
	
	finally:
		ctk_git_label("\nSauvegarde terminée.", bold=True)

btn_save = ctk.CTkButton(app, text="Sauvegarde", command=ly_save)
btn_save.pack(pady=10)

liste_fichiers = ctk.CTkScrollableFrame(app)
liste_fichiers.pack(pady=10, fill="both", expand=True)

#----------------------------------


app.mainloop()
