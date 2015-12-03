#!/bin/bash
# lancia cloud9 per questo progetto

# crea cartella log
mkdir -p log-ide

if [ -d ide ]
then
	cd ide
else
	git clone https://github.com/rossonet/IdeNode.git ide
	cd ide
fi

# aggiorna l'ide
echo "aggiorno l'ide..."
./scripts/install-sdk.sh >> ../log-ide/aggiornamenti.txt

# lancia cloud9
echo "lancio cloud9..."
nohup node server.js -p 8080 -a : -w ../book/ &>> ../log-ide/log.txt &
echo $! > ../log-ide/ide.pid

sleep 3

# lancia il browser
echo "provo la connessione con firefox..."
python -mwebbrowser http://127.0.0.1:8080/ide.html &

echo
echo "per stoppare l'ide utilizzare lo script feram-ise.sh"
echo

exit 0
