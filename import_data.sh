#!/usr/bin/env bash

#if [ $# -lt 3 ]; then
#	echo "[ERROR] Expecting: './import_data.sh [HOSTNAME] [MYSQL_USER] [MYSQL_PASSWORD] [MYSQL_DB]'"
#	exit
#fi

# Check for shit we need
echo '[INFO] Checking for necessary programs...'
UTILS=("dos2unix" "wget" "mysql" "unzip" "command")
for util in "${UTILS[@]}"
do
	command -v $util >/dev/null 2>&1 || { echo >&2 "[ERROR] Please install $util"; exit 1; }
	echo "[INFO] Found: $util"
done

export MY_HOSTNAME=$1
export MY_USER=$MYSQL_USER
export MY_PASS=$MYSQL_PASSWORD
export MY_DB=$MYSQL_DATABASE

export CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export MY_DIR=/tmp

# Current release
export DL_URL=https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR27/dnload/sr27asc.zip
export DL_URL2=https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR27/dnload/sr27abbr.zip

if [ ! -d "$MY_DIR/usda_tmp" ]; then
	echo '[INFO] Local tmp directory not found... creating one'
	mkdir -p $MY_DIR/usda_tmp
fi

echo '[INFO] Clearing all data in tmp directory'
rm -rf $MY_DIR/usda_tmp/*

wget $DL_URL -P $MY_DIR/usda_tmp
wget $DL_URL2 -P $MY_DIR/usda_tmp
ls $MY_DIR/usda_tmp/*.zip | xargs -n1 unzip -o -d $MY_DIR/usda_tmp/

dos2unix $MY_DIR/usda_tmp/*.txt
echo '[INFO] Generating raw data SQL statements'
ls $MY_DIR/usda_tmp/*.txt | xargs -n1 basename | perl -ne 'chomp; s/\.txt$//i;
print <<"EOF"
LOAD DATA LOCAL INFILE "$ENV{MY_DIR}/usda_tmp/$_.txt"
INTO TABLE $_ FIELDS TERMINATED BY "\^"
ENCLOSED BY "\~"
LINES TERMINATED BY "\\n";

EOF
' > $MY_DIR/usda_tmp/raw_data.sql

echo '[INFO] Executing combined raw and schema SQL statements...'
cat $CURR_DIR/schema.sql $MY_DIR/usda_tmp/raw_data.sql > $MY_DIR/usda_tmp/fin_out.sql
mysql --local-infile=1 -h$MY_HOSTNAME -u$MY_USER -p$MY_PASS $MY_DB < $MY_DIR/usda_tmp/fin_out.sql

echo '[INFO] Dump the .sql file for output'
mysqldump -h$MY_HOSTNAME -u$MY_USER -p$MY_PASS $MY_DB > /output/db_dump.sql
echo '[INFO] DONE'
