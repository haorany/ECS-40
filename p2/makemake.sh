#! /bin/bash
exefile=$1
if test -z $1; then
	printf "Executable name required."
	printf "\nusage: makemake.sh executable_name\n"
	exit
fi
shift
touch Makefile
printf "$exefile :">> Makefile 
for cppfile1 in *.cpp ; do
	ofile1=$(echo $cppfile1 | sed s/.cpp/.o/)
	printf " $ofile1" >> Makefile
done
printf "\n\tg++ -ansi -Wall -g -o $exefile">> Makefile
for argc in $@ ; do
	printf " $argc">> Makefile
done
for cppfile2 in *.cpp ; do
	ofile2=$(echo $cppfile2 | sed s/.cpp/.o/)
	printf " $ofile2" >> Makefile
done
printf "\n\n">> Makefile
for cppfile3 in *.cpp ; do
	ofile3=$(echo $cppfile3 | sed s/.cpp/.o/)
	printf "$ofile3 : $cppfile3" >> Makefile
	grep 'include \"' $cppfile3 | sed s/'#include "'//g | sed s/'"'//g >> temp
	number=$(grep 'include \"' $cppfile3 | sed s/'#include "'//g | sed s/'"'//g | wc -l)
	tempnumber=1
	while [ $tempnumber -le $number ]; do
		printf " " >>Makefile
		tempname=$(head -$tempnumber temp | tail -1)
		printf "$tempname" >>Makefile
		tempnumber=$(($tempnumber+1))
	done
	rm -f temp
	printf "\n\tg++ -ansi -Wall -g -c" >> Makefile
	for argc in $@ ; do
	printf " $argc">> Makefile
	done
	printf " $cppfile3\n" >> Makefile
	printf "\n">> Makefile
done
printf "clean :" >> Makefile
printf "\n\trm -f $exefile" >> Makefile
for cppfile4 in *.cpp ; do
	ofile4=$(echo $cppfile4 | sed s/.cpp/.o/)
	printf " $ofile4" >> Makefile
done
