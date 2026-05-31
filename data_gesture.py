import os
from pathlib import Path
import customtkinter as ctk
import git

app = ctk.CTk()
app.title("Sauvegarder Lilypond")

PWD = Path(__file__).resolve().parent

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
		raise git.exc.GitCommandError("Aucun changement à sauvegarder.", "")

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


btn_save = ctk.CTkButton(app, text="Sauvegarder", command=ly_save)
btn_save.pack(pady=10)
liste_fichiers = ctk.CTkScrollableFrame(app)
liste_fichiers.pack(pady=10, fill="both", expand=True)

app.mainloop()
