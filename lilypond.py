#!/usr/bin/env python3
import sys
import os
import subprocess
from pathlib import Path

for arg in sys.argv[1:]:
	if arg.endswith('.ly') and not arg.startswith('-'):
		FILE = Path(arg).resolve()
		break

PWD = FILE.parent

if os.path.exists("/opt/lilypond/bin/lilypond"):
	LILYPOND_BIN = "/opt/lilypond/bin/lilypond"
else:
	LILYPOND_BIN = "lilypond"

resultat = subprocess.run([LILYPOND_BIN, f"--output={PWD.parent}"] + sys.argv[1:])
sys.exit(resultat.returncode)