#!/bin/bash

# Init vars
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
arg=$1


# No argument provided
if [[ -z $arg ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Numeric argument provided
if [[ $arg =~ (^[0-9]+$) ]]
then
  atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$arg")

# Name argument provided
elif [[ ${#arg} -gt 2 ]]
then
  atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE name='$arg'")

# Symbol argument provided
else
  atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$arg'")
fi

if [[ -z $atomic_number ]]
then
  echo "I could not find that element in the database."
else
  element_name=$($PSQL "SELECT name FROM elements WHERE atomic_number=$atomic_number")
  element_symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$atomic_number")
  element_type=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE atomic_number=$atomic_number")
  element_mass=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$atomic_number")
  element_melting_point=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$atomic_number")
  element_boiling_point=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$atomic_number")
  echo The element with atomic number $atomic_number is $element_name "("$element_symbol")". It"'"s a $element_type, with a mass of $element_mass amu. $element_name has a melting point of $element_melting_point celsius and a boiling point of $element_boiling_point celsius.
fi