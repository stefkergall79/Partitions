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
	if REPO.index.diff(None):
		ctk_git_label("Fichiers modifiés", bold=True)
		for file in REPO.index.diff(None):
			ctk_git_label(f"{file.a_path}")
	
	if REPO.untracked_files:
		ctk_git_label("\nNouveaux fichiers", bold=True)
		for file in REPO.untracked_files:
			ctk_git_label(f"{file}")

	if not REPO.index.diff(None) and not REPO.untracked_files:
		ctk_git_label("Aucun changement à sauvegarder.", bold=True)
		raise git.exc.GitCommandError("git", "Rien à sauvegarder")

def ly_save():
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
