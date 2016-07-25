#!/bin/bash

# Array .data generator for selection.asm
#
# @author Farrukh Yakubov
# @date 07/25/2016

# check for missing argument, print usage if missing
if [ $# -ne 1 ]
then
    echo "Usage: "$0" <output.asm>"
    exit 1
fi

OUTFILE=$1 #output file to contain generated arrays' data

# append .asm extension to output file name if extension is missing or not .asm
if [ ${OUTFILE: -4} != ".asm" ]
then
    OUTFILE=$OUTFILE".asm"
fi

# generator control constants
# note: selection.asm is set to process only the first ten arrays

NUM_ARRAYS=10 #number of arrays to be generated
MAX_ARRAYLEN=100 #maximum allowed length of an array
MIN_ARRAYLEN=5 #minumum allowed length of an array
MAX_ELEMENT=1000 #maximum allowed array element value
MIN_ELEMENT=0 #minimum allowed array element value
MIN_K=2 #minimum value for k, max is defined by current array lenght

# getRandomInRange - generates a random number within the specified range
#
# Usage: `getrandomInRage $min $max`
function getRandomInRange {
	local min=$1
	local max=$2
	let local randomNum="$min+$RANDOM%($max-$min)"
	echo $randomNum
}

# getRandomInRange - generates an array of specified length, with each element
# being a random value within $minElement and $maxElement
#
# Usage: `getRandomArrayOfLen $arrayLen $minElement $maxElement`
function getRandomArrayOfLen {
	local arrayLen=$1
	local minElement=$2
	local maxElement=$3
	local arrayElements=''
	
	local elementIndex=0
	while [ $elementIndex -lt $arrayLen ]
	do
		local element=`getRandomInRange $minElement $maxElement`
		if [ $elementIndex -ne 0 ]
		then 
			arrayElements=$arrayElements", "$element
		else
			arrayElements=$element
		fi
		let "elementIndex++"
	done
	
	echo $arrayElements
}

#mark the following content as .data
echo "  .data" > $OUTFILE

#generate the arrays with random length and random element values
currArrayIndex=0
while [ $currArrayIndex -lt $NUM_ARRAYS ]
do
	# create current array length, kth element to find, and the elements
	currArrayLen=`getRandomInRange $MIN_ARRAYLEN $MAX_ARRAYLEN`
	currArrayK=`getRandomInRange $MIN_K $currArrayLen`
	currArrayElements=`getRandomArrayOfLen $currArrayLen $MIN_ELEMENT $MAX_ELEMENT`
	
	# print current array length, kth element to find, and the elements
	echo "size"`expr $currArrayIndex + 1`": .word "$currArrayLen
	echo "k"`expr $currArrayIndex + 1`": .word "$currArrayK
	echo "array"`expr $currArrayIndex + 1`"a: .word "$currArrayElements
	
	let "currArrayIndex++"
done >> $OUTFILE

