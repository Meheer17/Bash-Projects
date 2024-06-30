#!/bin/bash

if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
  exit
fi
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
else
  ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
fi

if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit
fi

echo "$ELEMENT" | while IFS='|' read AN S N T AM MP BP
do
echo "The element with atomic number $AN is $N ($S). It's a $T, with a mass of $AM amu. $N has a melting point of $MP celsius and a boiling point of $BP celsius."
done