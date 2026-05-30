import os
from pathlib import Path
import customtkinter as ctk
import git

app = ctk.CTk()
app.title("Gestion des données de Lilypond")
app.geometry("550x600")

PWD = Path(__file__).resolve().parent

#----------------------------------
# Sauvegarde Git

REPO = git.Repo(PWD)

def ctk_git_label(text, title=False):
	font = ctk.CTkFont(family="Arial", size=16, weight="bold" if title else "normal")
	ctk.CTkLabel(liste_fichiers, text=text, font=font, anchor="w").pack(fill="x")


def ctk_git_status():
    for widget in liste_fichiers.winfo_children():
        widget.destroy()

    fichiers_modifies = REPO.index.diff(None)
    fichiers_non_suivis = REPO.untracked_files
    
    if fichiers_modifies:
        ctk_git_label("Fichiers modifiés :", title=True)
        for file in fichiers_modifies:
            ctk_git_label(f"\t- {file.a_path}")
    
    if fichiers_non_suivis:
        ctk_git_label("\nNouveaux fichiers :", title=True)
        for file in fichiers_non_suivis:
            ctk_git_label(f"\t- {file}")

    if not fichiers_modifies and not fichiers_non_suivis:
        ctk_git_label("Aucun changement à sauvegarder.", title=True)


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
	
	ctk_git_label("\nSauvegarde terminée.", title=True)

#----------------------------------
def ly_wash():
	pile = [PWD]
	dossiers_cache = []
	
	# 1. ⚡ RECHERCHE DES CACHES
	while pile:
		actuel = pile.pop()
		try:
			with os.scandir(actuel) as it:
				for entry in it:
					if entry.is_dir(follow_symlinks=False):
						nom = entry.name.lower()
						if nom in ('cache', '.cache') or 'cache' in nom:
							dossiers_cache.append(entry.path)
						else:
							pile.append(entry.path)
		except PermissionError:
			pass

	fichiers_supprimes = []
	extensions_a_supprimer = ('.pdf', '.midi', '.mid')

	for chemin_cache in dossiers_cache:
		dossier_parent = os.path.dirname(chemin_cache)
		
		try:
			with os.scandir(dossier_parent) as it:
				for entry in it:
					if entry.is_file(follow_symlinks=False):
						if entry.name.lower().endswith(extensions_a_supprimer):
							try:
								os.remove(entry.path)
								# On stocke le nom du fichier pour l'affichage
								fichiers_supprimes.append(entry.name)
							except FileNotFoundError:
								pass
		except PermissionError:
			pass

	for widget in liste_fichiers.winfo_children():
		widget.destroy()

	if fichiers_supprimes:
		ctk_git_label("Fichiers supprimés :", title=True)
		for nom_fichier in fichiers_supprimes:
			ctk_git_label(nom_fichier)
	else:
		ctk_git_label("Aucun fichier à nettoyer.", title=True)


# Main
cadre_boutons = ctk.CTkFrame(app, fg_color="transparent")
cadre_boutons.pack(pady=10)
btn_save = ctk.CTkButton(cadre_boutons, text="Sauvegarder", command=ly_save)
btn_save.grid(row=0, column=0, padx=10)
btn_wash = ctk.CTkButton(cadre_boutons, text="Nettoyer", command=ly_wash)
btn_wash.grid(row=0, column=1, padx=10)

liste_fichiers = ctk.CTkScrollableFrame(app)
liste_fichiers.pack(pady=10, fill="both", expand=True)

app.mainloop()
