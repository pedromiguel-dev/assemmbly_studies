#!/bin/bash

output='main'
link_c="false"
while getopts s:o:l:c: flag
do
    case "${flag}" in
        s) source=${OPTARG};;
		o) output=${OPTARG};;
		l) link_c=${OPTARG};;
		c)	c_files=${OPTARG};;
    esac
done

echo "--------$c_files";

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
	gcc -no-pie -m32 $output.o $c_files -o $output
else	
	nasm -f elf -o $output.o $source
	echo "lining: $source";
	ld -m elf_i386 -o $output $output.o
fi