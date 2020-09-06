#mysql-server paigaldusskript
#
# kontrollime, mitu korda mysql-server korral ok installed
# sonad on leitud ja vastus salvestama muutuja sisse:
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
# kui MYSQL muutuja vaartus vordub 0-ga:
if [ $MYSQL -eq 0 ]; then
	# siis ok installed ei ole leitud
	# ja valjastame vastava teate ning paigaldame teenuse
	echo "Paigaldame mysql ja vajalikud lisad"
	apt install mysql-server
	echo "Mysql on paigaldatud."
	# lisame voimaluse kasutada mysql kask ilma kasutaja ja parooli sisestamata:
	touch $HOME/.my.cnf # lisame vajaliku konfiguratsiooni faili antud kasutaja kodukausta
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
# kui MYSQL muutuja vaartus vordub 1-ga:
elif [ $MYSQL -eq 1 ]; then
	# siis ok installed on leitud 1 kord
	# ja teenus on juba paigaldatud 
	echo "mysql-server on juba paigaldatud"
	# kontrollime olemasolu
	mysql
#lopetame tingimuslause
fi
#skripti lopp
