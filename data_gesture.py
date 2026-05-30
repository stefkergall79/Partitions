import os
import shutil
from pathlib import Path
import tkinter as tkt
import git

app = tkt.Tk()
app.title("Gestion des données de Lilypond")
app.geometry("550x600")

PWD = Path(__file__).resolve().parent

def ly_save():
	pwd=git.Repo(PWD)
	
	pwd.git.add(".")
	pwd.index.commit("Modifications")
	
	try:
		pwd.remote(name="origin").pull()
		pwd.remote(name="origin").push()
	except git.exc.GitCommandError:
		git_config = git.Git().config
		git_config("--global", "user.name", "Stéphane Kergall")
		git_config("--global", "user.email", "stef.kergall@gmail.com")
		pwd.remote(name="origin").pull()
		pwd.remote(name="origin").push()

btn_save = tkt.Button(app, text="Sauvegarde", command=ly_save)
btn_save.pack()

app.mainloop()