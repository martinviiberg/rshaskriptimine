#!/bin/bash
#
#kasutaja lisamise skript
#kasutaja nimi tuleb anda skripti parameetrina
#skript peab antud nimega kasutajat lisama systeemi ja pakkuma sobiliku shelli
#
#kasurea kaudu parameetrite arv on $# sees olev number,
#meie korral peab olema 1 parameeter - kasutajanimi
#kui aga antud parameeter ei ole lisatud - tuleb juhendada kasutajat, kuidas skriptiga tood teha
if [ $# -ne 1 ]; then
	echo "Kasutusjuhend: $0 kasutajanimi"
else
	#defineerime vajalik muutuja kasutajanime salvestamiseks
	#kuna andmed edastataksee kasurealt skripti parameetrina, siis need on $1 ja $2 jne
	#kasutajanimi on esimene parameeter, seega tuleb kasutada $1 muutujat
	kasutajanimi=$1
	#kasutame kasutaja lisamiseks k2sk vajalike v6tmetega
	useradd $kasutajanimi -m -s /bin/bash
	#kontrollime tulemust
	if [ $? -eq 0 ]; then
		echo "Kasutaja nimega $kasutajanimi on lisatud systeemi."
		cat /etc/passwd | grep $kasutajanimi
	else 
		echo "Probleem kasutaja $kasutajanimi lisamisega."
		echo "Probleemi kood on $?"

	fi
fi

