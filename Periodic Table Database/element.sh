#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ -z $1 ]] 
then
  echo Please provide an element as an argument.
else
  # case atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
    TYPE=$($PSQL "SELECT types.type FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$1")

    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1")

    echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  # other cases
  else 
    ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")

    if [[ -z $ATOMIC_NUM ]]
    then 
      ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
      if [[ -z $ATOMIC_NUM ]]
      then
        echo I could not find that element in the database.
      else
        # case name
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUM")
        TYPE=$($PSQL "SELECT types.type FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUM")

        MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUM")
        BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUM")
        MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUM")

        echo "The element with atomic number $ATOMIC_NUM is $1 ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $1 has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      fi
    else
      # case symbol
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUM")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUM")
      TYPE=$($PSQL "SELECT types.type FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUM")

      MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUM")
      BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUM")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUM")

      echo "The element with atomic number $ATOMIC_NUM is $NAME ($1). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  fi
fi
