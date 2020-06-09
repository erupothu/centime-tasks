#!/bin/sh

# svn checkout http://13.127.98.208/svn/myrepo/firstservice
# cd firstservice
echo "modify permissions"
chmod 777 log.txt
chmod 777 pid.file

echo "killing existing server"
kill $(cat pid.file)

echo "building project"
mvn package

echo "deploying project"
nohup java -jar target/first-service.jar > log.txt 2>&1 &
echo $! > pid.file
