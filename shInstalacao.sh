#!/bin/bash
sudo apt update && sudo apt upgrade -y
java --version
if [ $? -eq 0 ];
then
	echo "Verificando a versão"
	if [ $version != 18 ];
	then
		echo "Versão do java direfente do 18"
		sudo apt list --installed | grep open jdk
		sudo apt rm $?
		echo "Iniciando a instalação"
		sudo apt-get install openjdk-18-jdk
	else
		echo "Versão do java correta"
	fi
else
	echo "Java não instalado, iniciando a instalação"
	sudo apt-get install openjdk-18-jdk
fi
docker --version
if [ $? > 0 ];
then
	echo "TESTE PARA VER SE FUNCIONA IF.............................................................................................................................................................................."
	sudo apt install docker.io -y
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo docker pull mysql:5.7
	sudo docker run -d -p 3306:3306 --name PontoSa -e "MYSQLDATABASE=PontoSa" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
	sudo docker exec -it PontoSa bash -c "mysql --password=urubu100 --user=root --host=localhost"
	
else
	echo "TESTE PARA VER SE FUNCIONA ELSE por que n ta aindo.............................................................................................................................................................................."
	sudo apt install docker.io -y
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo docker pull mysql:5.7
	sudo docker run -d -p 3306:3306 --name PontoSa -e "MYSQLDATABASE=PontoSa" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
	sudo docker exec -it PontoSa bash -c "mysql --password=urubu100 --user=root --host=localhost"
	source entrarMysql.sh
fi