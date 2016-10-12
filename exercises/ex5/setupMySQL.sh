#!/bin/bash -e
# Bash Shell Script to facilitate MySQL setup

#__author__ = "Sanjay Joshi"
#__copyright__ = "Copyright 2016 IBM"
#__credits__ = ["Sanjay Joshi"]
#__license__ = "Apache 2.0"
#__version__ = "1.0"
#__maintainer__ = "Sanjay Joshi"
#__email__ = "joshisa@us.ibm.com"
#__status__ = "Demo"

# Reference
#   http://blog.ibmjstart.net/2016/04/14/e-pluribus-unum-creating-openstack-manifest-objects-in-ibm-bluemix-object-storage/

# Overview:
# Container ACLs:  Container Access Control Lists (ACLs) are available on any Swift cluster,
# and are enabled per container, rather than per cluster.

##########
# Colors##
##########
Green='\x1B[0;32m'
Red='\x1B[0;31m'
Yellow='\x1B[0;33m'
Cyan='\x1B[0;36m'
no_color='\x1B[0m' # No Color
beer='\xF0\x9f\x8d\xba'
delivery='\xF0\x9F\x9A\x9A'
beers='\xF0\x9F\x8D\xBB'
eyes='\xF0\x9F\x91\x80'
cloud='\xE2\x98\x81'
crossbones='\xE2\x98\xA0'
litter='\xF0\x9F\x9A\xAE'
fail='\xE2\x9B\x94'
harpoons='\xE2\x87\x8C'
tools='\xE2\x9A\x92'
present='\xF0\x9F\x8E\x81'
hourglass='\xE2\x8F\xB3'
#############

clear

targetClearDBInstance=$1

echo -e "${tools}${Cyan}  Welcome to the MySQL Setup Helper Script${no_color}"
echo -e "${tools}${Green}  Brought to you courtesy of IBM ${no_color}"
echo -e "${tools}  setupMySQL.sh${Cyan} invoked${no_color}"
if [ $# -eq 0 ]
  then
    echo -e "${crossbones}${Red}  One (1) Argument required, none provided. ClearDB Service Instance name :-(${no_color}"
    echo -e "${crossbones}${Yellow}  ClearDB Service Instance: ${Red}missing${no_color}"
    exit 1
fi

source ./svcinspect.sh ${targetClearDBInstance}

echo -e "${harpoons}${Yellow}  Fetching mysql-connector-java-5.1.39-bin.jar from ${Cyan}http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz${no_color}"
wget -nv http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz -O mysql-connector.tar.gz
tar -zxf mysql-connector.tar.gz
cp ./mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar .
rm -rf mysql-connector-java-5.1.39
rm mysql-connector.tar.gz

echo -e "${harpoons}${Yellow}  Fetching commons-cli-1.3.1.jar from ${Cyan}http://www.gtlib.gatech.edu/pub/apache//commons/cli/binaries/commons-cli-1.3.1-bin.tar.gz${no_color}"
wget -nv http://www.gtlib.gatech.edu/pub/apache//commons/cli/binaries/commons-cli-1.3.1-bin.tar.gz -O commons-cli.tar.gz
tar -zxf commons-cli.tar.gz
cp ./commons-cli-1.3.1/commons-cli-1.3.1.jar .
rm -rf commons-cli-1.3.1
rm commons-cli.tar.gz

echo -e "${delivery}${Yellow}  Compiling Exercise 5 Java Setup, Populate and Query Utility${no_color}"
javac -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ./ex4.java
echo -e "${hourglass}${Green}  Executing utility to see the arguments available ...${no_color}"
java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -w

echo -e "${eyes}${Green}  Invoking ${Yellow}java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -h ${val1} -u ${val7} -p ${val4} -n ${val5} -d ${val3} -s './setup.sql'${no_color}"
java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -h "${val1}" -u "${val7}" -p "${val4}" -n "${val5}" -d "${val3}" -s "./remove.sql"
java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -h "${val1}" -u "${val7}" -p "${val4}" -n "${val5}" -d "${val3}" -s "./setup.sql"
echo -e "${present}${Yellow}  Employees Table Created${no_color}"
echo -e "\n"

echo -e "${eyes}${Green}  Invoking ${Yellow}java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -h ${val1} -u ${val7} -p ${val4} -n ${val5} -d ${val3} -s './populate.sql'${no_color}"
java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -h "${val1}" -u "${val7}" -p "${val4}" -n "${val5}" -d "${val3}" -s "./populate.sql"
echo -e "${present}${Yellow}  Employees Table Populated${no_color}"
echo -e "\n"

echo -e "${delivery}${Green}  Awesome sauce! Let's try to query against the database to confirm that our data is really in there ;-)${no_color}"
echo -e "${eyes}${Green}  Invoking ${Yellow}java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 ${Cyan}--query${Yellow} -h ${val1} -u ${val7} -p ${val4} -n ${val5} -d ${val3} -s './query.sql'${no_color}"
echo -e "\n"
java -cp .:./mysql-connector-java-5.1.39-bin.jar:./commons-cli-1.3.1.jar ex4 -h "${val1}" -u "${val7}" -p "${val4}" -n "${val5}" -d "${val3}" -s "./query.sql" --query > ./results.tsv
head ./results.tsv

# For more information about Global Read, checkout 
echo -e "${eyes}${Green}  For more information about Bluemix ClearDB MySQL services, visit: ${Cyan}https://console.ng.bluemix.net/catalog/services/cleardb-mysql-database${no_color}"
echo -e "${beers}  ${Green}finis coronat opus${no_color}"
