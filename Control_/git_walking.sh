#!/bin/bash

function process_student 
{
    #Tokenizing
    IFS='!'; temp=($1); unset IFS;
	IFS='/'; url=($1); unset IFS;
	IFS='.'; folder=(${temp[4]}); unset IFS;
	# make dir for each student
	mkdir ./${temp[0]}
	cd ./${temp[0]}
	git clone ${temp[1]}
    cd ..
}

while IFS='' read -ra line || [[ -n "$line" ]]; do
	echo "Text read from file: $line"
    process_student "$line"
done < "$1"

# Process Stats