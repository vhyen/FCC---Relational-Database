#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_INFO=$($PSQL "SELECT 1 FROM record WHERE username='$USERNAME'")
if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else 
  GAMES_COUNT=$($PSQL "SELECT COUNT(*) FROM record WHERE username='$USERNAME'")
  BEST_GUESS=$($PSQL "SELECT MIN(guess_times) FROM record WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_GUESS guesses."
fi

TARGET=$(( ( $RANDOM % 1000 ) + 1 ))
CNT=0

GUESS() {
  echo "$1"
  read GUESS
  (( CNT++ ))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:"
  else
    if [[ $GUESS > $TARGET ]]
    then
      GUESS "It's lower than that, guess again:"
    fi
    if [[ $GUESS < $TARGET ]]
    then 
      GUESS "It's higher than that, guess again:"
    fi
    if [[ $GUESS == $TARGET ]]
    then
      return
    fi
  fi
}

GUESS "Guess the secret number between 1 and 1000:"
INSERT_RESULT=$($PSQL "INSERT INTO record VALUES ('$USERNAME', $CNT);")
echo "You guessed it in $CNT tries. The secret number was $TARGET. Nice job!"

