#!/bin/bash

output='main'
link_c="false"
while getopts s:o:l: flag
do
    case "${flag}" in
        s) source=${OPTARG};;
		o) output=${OPTARG};;
		l) link_c=${OPTARG};;
    esac
done

filename="./$source"

if [ -f $filename ];
then
	echo "building: $source";
else
	echo "$source not found";
	exit
fi

if [ "$link_c" == "true" ];
then
	nasm -f elf -o $output.o $source
	echo "lining: $source with c functions";
	gcc -no-pie -m32 $output.o -o $output
else	
	nasm -f elf -o $output.o $source
	echo "lining: $source";
	ld -m elf_i386 -o $output $output.o
fi