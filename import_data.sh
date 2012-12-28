#!/usr/bin/env bash

if [ $# -lt 3 ]; then
	echo "Expecting: './import_data.sh [MYSQL_USER] [MYSQL_PASSWORD] [MYSQL_DB]'"
	exit
fi

export MY_USER=$1
export MY_PASS=$2
export MY_DB=$3

export MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Current release
export DL_URL=https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR25/dnload/sr25.zip

if [ ! -d "$MY_DIR/tmp" ]; then
	echo 'Local tmp directory not found... creating one'
	mkdir -p $MY_DIR/tmp
fi

echo 'Clearing all data in tmp directory'
rm -rf $MY_DIR/tmp/*

wget $DL_URL -P $MY_DIR/tmp
unzip -d tmp/ tmp/sr25.zip

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
mysql --local -u$MY_USER -p$MY_PASS $MY_DB < $MY_DIR/tmp/fin_out.sql

echo 'DONE'
