#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
T=$($PSQL "TRUNCATE teams, games;")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # ====== INSERT TEAMS ====== #
    TEAM_ID_1=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $TEAM_ID_1 ]]
    then
      INSERT_TEAM_1=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_1 = "INSERT 0 1" ]]
      then
        TEAM_ID_1=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi
    fi

    TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $TEAM_ID_2 ]]
    then
      INSERT_TEAM_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_2 = "INSERT 0 1" ]]
      then
        TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi
    fi

    # ====== INSERT GAMES ====== #
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_1, $TEAM_ID_2, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done