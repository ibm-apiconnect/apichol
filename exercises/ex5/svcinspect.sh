#!/bin/bash -e
# Bash Shell Script to facilitate the Hands On Lab @ Java One 2016

#__author__ = "Sanjay Joshi"
#__copyright__ = "Copyright 2016 IBM"
#__credits__ = ["Sanjay Joshi"]
#__license__ = "Apache 2.0"
#__version__ = "1.0"
#__maintainer__ = "Sanjay Joshi"
#__email__ = "joshisa@us.ibm.com"
#__status__ = "Demo"

# Overview: Modular script to facilitate credential inspection and persistence

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
#############

echo -e ""
echo -e "${tools}${Cyan}  Welcome to the Service Inspector ...${no_color}"
if [ $# -eq 0 ]
  then
    echo -e "${crossbones}${Red}  No targetInstance argument supplied :-(${no_color}"
    exit 1
fi
targetInstance=$1
echo -e "${eyes}${Yellow}  Target Instance: ${Cyan}${targetInstance}${no_color}"
echo -e "${tools}${Cyan}  Interrogating Service Instance for Credentials ...${no_color}"
headerLineNum=$(cf service-keys $targetInstance | grep -n "name" | awk '{print $1}' FS=":")
if [ -z "${headerLineNum}" ]; then
  errorCheck=$(cf service-keys $targetInstance || true)
  loginCheckFail=$(echo -e ${errorCheck} | grep "Not logged in" || true)
  instanceNotFound=$(echo -e ${errorCheck} | grep "not found" || true)
  echo -e $loginCheckFail
  echo -e $instanceNotFound
  if [ ! -z "${loginCheckFail}" ]; then
    echo -e "${crossbones}${Red}  No Bluemix Cloud Foundry login context detected ${no_color}"
    exit 1
  elif [ -n "${instanceNotFound}" ]; then
    echo -e "${crossbones}${Red}  The service instance ${Cyan}${targetInstance}${Red} cannot be found found within this target org and space${no_color}"
    exit 1
  else
    echo -e "${crossbones}${Red}  Something went wrong during the service-keys query.${no_color}"
    cf service-keys $targetInstance
  fi
fi


# TODO: Better to loop and populate, but this is a hack afterall :-)
# As a result, this is very brittle and depends on no changes in the
# alphabet sorting or number of elements provided in the default
# object storage credential set.

keyNameLineNum=$(expr $headerLineNum + 1)
serviceKey=$(cf service-keys $targetInstance | sed -n "$keyNameLineNum{p;q;}")
echo -e "${eyes}${Yellow}    Service Key Found: ${Cyan}${serviceKey}${no_color}"
creds=$(cf service-key $targetInstance $serviceKey)
echo -e "${tools}${Cyan}    Parsing Service Key ...${no_color}"
key1=$(echo $creds | awk -F\" '{print $2}')
val1=$(echo $creds | awk -F\" '{print $4}')
key2=$(echo $creds | awk -F\" '{print $6}')
val2=$(echo $creds | awk -F\" '{print $8}')
key3=$(echo $creds | awk -F\" '{print $10}')
val3=$(echo $creds | awk -F\" '{print $12}')

key4=$(echo $creds | awk -F\" '{print $14}')
# Outstanding CF CLI bug on unicode and ampersands
# https://github.com/cloudfoundry/cli/issues/794
valtemp4=$(echo $creds | awk -F\" '{print $16}')
valtemp4a=$(echo -e $(eval "echo -e '${valtemp4}'"))
# Replacing the unexpected unicode escape sequence with its ampersand char
val4=${valtemp4a//\\u0026/&}

key5=$(echo $creds | awk -F\" '{print $18}')
val5=$(echo $creds | awk -F\" '{print $20}')
key6=$(echo $creds | awk -F\" '{print $22}')
val6=$(echo $creds | awk -F\" '{print $24}')

if [ "${key1}" = "hostname" ]; then
  instanceType="ClearDB"
  key7=$(echo $creds | awk -F\" '{print $26}')
  val7=$(echo $creds | awk -F\" '{print $28}')
  echo -e "${present}${Yellow}    Service Instance Type: ${Cyan}${instanceType}${no_color}"
  # hostname == key1
  echo -e "${present}${Yellow}      ${key1}: ${Cyan}${val1}${no_color}"
  # jdbcUrl == key2
  echo -e "${present}${Yellow}      ${key2}: ${Cyan}${val2}${no_color}"
  # dbname == key3
  echo -e "${present}${Yellow}      ${key3}: ${Cyan}${val3}${no_color}"
  # password == key4
  echo -e "${present}${Yellow}      ${key4}: ${Cyan}${val4}${no_color}"
  # port == key5
  echo -e "${present}${Yellow}      ${key5}: ${Cyan}${val5}${no_color}"
  # uri == key6
  echo -e "${present}${Yellow}      ${key6}: ${Cyan}${val6}${no_color}"
  # username == key7
  echo -e "${present}${Yellow}      ${key7}: ${Cyan}${val7}${no_color}"
fi
