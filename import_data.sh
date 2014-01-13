#!/usr/bin/env bash

if [ $# -lt 3 ]; then
	echo "Expecting: './import_data.sh [HOSTNAME] [MYSQL_USER] [MYSQL_PASSWORD] [MYSQL_DB]'"
	exit
fi

# Check for shit we need
echo 'Checking for necessary programs...'
UTILS=("dos2unix" "wget" "mysql" "unzip" "command")
for util in "${UTILS[@]}"
do
	command -v $util >/dev/null 2>&1 || { echo >&2 "Please install $util"; exit 1; }
	echo "Found: $util"
done

export MY_HOSTNAME=$1
export MY_USER=$2
export MY_PASS=$3
export MY_DB=$4

export MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Current release
export DL_URL=https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR26/dnload/sr26.zip
export DL_URL2=https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR26/dnload/sr26abbr.zip

if [ ! -d "$MY_DIR/tmp" ]; then
	echo 'Local tmp directory not found... creating one'
	mkdir -p $MY_DIR/tmp
fi

echo 'Clearing all data in tmp directory'
rm -rf $MY_DIR/tmp/*

wget $DL_URL -P $MY_DIR/tmp
wget $DL_URL2 -P $MY_DIR/tmp
ls tmp/*.zip | xargs -n1 unzip -o -d tmp/

dos2unix tmp/*.txt
echo 'Generating raw data SQL statements'
ls tmp/*.txt | xargs -n1 basename | perl -ne 'chomp; s/\.txt$//i;
print <<"EOF"
LOAD DATA LOCAL INFILE "$ENV{MY_DIR}/tmp/$_.txt"
INTO TABLE $_ FIELDS TERMINATED BY "\^"
ENCLOSED BY "\~"
LINES TERMINATED BY "\\n";

EOF
' > $MY_DIR/tmp/raw_data.sql

echo 'Executing combined raw and schema SQL statements...'
cat $MY_DIR/schema.sql $MY_DIR/tmp/raw_data.sql > $MY_DIR/tmp/fin_out.sql
mysql --local-infile=1 -h$MY_HOSTNAME -u$MY_USER -p$MY_PASS $MY_DB < $MY_DIR/tmp/fin_out.sql

echo 'DONE'
