#!/bin/bash

# Bingo Number Generator

echo -e "\n~~ Bingo Number Generator ~~\n"

NUMBER=$(( RANDOM%75+1 ))

if (( NUMBER <= 15 ))
then 
echo $TEXT B:$NUMBER
elif (( NUMBER <= 30 ))
then 
echo $TEXT I:$NUMBER
elif (( NUMBER <= 46 ))
then
echo $TEXT N:$NUMBER
elif (( NUMBER <= 61 ))
then 
echo $TEXT G:$NUMBER
else
echo $TEXT M:$NUMBER
fi