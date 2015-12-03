#!/bin/bash
# lancia cloud9 per questo progetto

echo "arresto l'ide di sviluppo cloud9..."

if [ -e log-ide/ide.pid ]
then
	kill $(cat log-ide/ide.pid)
	rm log-ide/ide.pid
else
	echo "Nessun processo trovato..."
fi
