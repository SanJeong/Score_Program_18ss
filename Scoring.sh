#!/bin/bash

function process_student {
	IFS='!'; temp=($1); unset IFS;
	IFS='/'; url=($1); unset IFS;
	IFS='.'; folder=(${temp[4]}); unset IFS;
	echo "###########################${temp[0]}#################"
	cp ./Makefile_p2 ./${temp[0]}/${url[4]}/Problem02/Makefile
	cp ./problem2_check.py ./${temp[0]}/${url[4]}/Problem02/problem2_check.py
	cp ./Makefile_p3 ./${temp[0]}/${url[4]}/Problem03/Makefile
	cp ./problem3_check.py ./${temp[0]}/${url[4]}/Problem03/problem3_check.py
	cp ./Makefile_p4 ./${temp[0]}/${url[4]}/Problem04/Makefile
	cp ./problem4_check.py ./${temp[0]}/${url[4]}/Problem04/problem4_check.py
	cp ./cal.txt ./${temp[0]}/${url[4]}/Problem04/cal.txt
	cp ./Makefile_p5 ./${temp[0]}/${url[4]}/Problem05/Makefile
	cp ./problem5_check.py ./${temp[0]}/${url[4]}/Problem05/problem5_check.py
	cp ./word.txt ./${temp[0]}/${url[4]}/Problem05/word.txt
	cp ./output ./${temp[0]}/${url[4]}/Problem05/output
	cd ./${temp[0]}
	cd ./${url[4]}
    
    #p2
    cd Problem02
	rm -f Problem02
	make clean
	make
	echo "Checking Problem02..."
	python3.6 problem2_check.py ${temp[0]}
	echo "done."
	cd ..
	
	#p3
	cd Problem03
	rm -f Problem03
	make clean
	make
	echo "Checking Problem03..."
	python3.6 problem3_check.py ${temp[0]}
	echo "done."
	cd ..
	
	#p4
	cd Problem04
	rm -f Problem04
	make clean
	make
	echo "Checking Problem04..."
	python3.6 problem4_check.py ${temp[0]}
	echo "done."
	cd ..
	
	#p5
	cd Problem05
	rm -f Problem05
	rm -f problem4_check.py
	rm -f cal.txt
	make clean
	make
	echo "Checking Problem05..."
	cp ./problem05.cpp ./problem05.txt  
	python3.6 problem5_check.py ${temp[0]}
	echo "done."
	cd ..
	
	
	
	cd ..
	cd ..
}

while IFS='' read -ra line || [[ -n "$line" ]]; do
	echo "Text read from file: $line"
    process_student "$line"
done < "$1"