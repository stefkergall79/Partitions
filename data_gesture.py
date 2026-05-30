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
repo = git.Repo(PWD)


def ctk_git_label(text):
	ctk.CTkLabel(liste_fichiers, text=text).pack(fill="x")


def ctk_git_status():
	ctk_git_label("Fichiers modifiés")

	for file in repo.index.diff(None):
		ctk_git_label(f"{file.a_path}")
	
	ctk_git_label("\nNouveaux fichiers")

	for file in repo.untracked_files:
		ctk_git_label(f"{file}")


def ly_save():
	
	ctk_git_status()
	repo.index.commit("Modifications")
	repo.git.add(".")
	repo.index.commit("Sauvegarde")
	
	try:
		repo.remote(name="origin").pull()
		repo.remote(name="origin").push()
	except git.exc.GitCommandError:
		git_config = git.Git().config
		ctk_git_label("Configuration de la sauvegarde nécessaire...")
		git_config("user.name", "Stéphane Kergall")
		git_config("user.email", "stef.kergall@gmail.com")
		repo.remote(name="origin").pull()
		repo.remote(name="origin").push()
	finally:
		ctk_git_label("Sauvegarde terminée.")

btn_save = ctk.CTkButton(app, text="Sauvegarde", command=ly_save)
btn_save.pack(pady=10)

liste_fichiers = ctk.CTkScrollableFrame(app)
liste_fichiers.pack(pady=10, fill="both", expand=True)


app.mainloop()
