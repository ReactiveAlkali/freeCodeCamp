#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Exit when the user provides no arguments
if [[ $# -eq 0 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Get the basic info of the element
ELEMENT_QUERY="SELECT atomic_number, symbol, name FROM elements WHERE"
if [[ $1 =~ ^[0-9]+$ ]]
then # atomic number 
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY atomic_number=$1")
elif [[ ${#1} -le 2 ]]
then # symbol
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY symbol='$1'")
else # name
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY name='$1'")
fi

# Get the properties of the element
if [[ -z $ELEMENT_RESULT ]]
then
  echo "I could not find that element in the database."
  exit
else
  IFS="|" read ATOMIC_NUMBER SYMBOL NAME <<< "$ELEMENT_RESULT"
  PROPERTIES_RESULT=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  IFS="|" read ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID <<< "$PROPERTIES_RESULT"
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
fi

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
