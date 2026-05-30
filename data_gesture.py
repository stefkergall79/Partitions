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

def ctk_git_status():
	ctk.CTkLabel(liste_fichiers, text="Fichiers modifiés").pack(fill="x")

	for file in repo.index.diff(None):
		ctk.CTkLabel(liste_fichiers, text=f"{file.a_path}\n").pack(fill="x")
	
	ctk.CTkLabel(liste_fichiers, text="Nouveaux fichiers").pack(fill="x")

	for file in repo.untracked_files:
		ctk.CTkLabel(liste_fichiers, text=f"{file}\n").pack(fill="x")


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
		git_config("--global", "user.name", "Stéphane Kergall")
		git_config("--global", "user.email", "stef.kergall@gmail.com")
		repo.remote(name="origin").pull()
		repo.remote(name="origin").push()

btn_save = ctk.CTkButton(app, text="Sauvegarde", command=ly_save)
btn_save.pack(pady=10)

liste_fichiers = ctk.CTkScrollableFrame(app)
liste_fichiers.pack(pady=10, fill="both", expand=True)


app.mainloop()
