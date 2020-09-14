#!/bin/bash
#
#kasutajanime lisamise skript 
if [ $# -ne 1 ]; then
	echo  "Kasutusjuhend: $0 failinimi"
else
	failinimi=$1
	if [ -f $failinimi -a -r $failinimi ]; then
		echo "Fail on korras."
		for nimi in $(cat $failinimi)
		do 
		# sellega peaks faili sisu olema nahtav, kuna fail on katte saadav ja nyyd echo
		# asemel tuleb kutsuda vajalik skript
		# echo $rida
		sh lisa_kasutaja.sh $nimi # sellega me laseme lisa_kasutaja skripti toole
		done
	else 
		echo "Probleem failiga $failinimi."
	fi
# parameetrite kontrolli l6pp
fi
