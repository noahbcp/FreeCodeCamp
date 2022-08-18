#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != "year" ]] # Exclude first row of csv
then
  # Handle teams
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  if [[ -z $WINNER_ID ]]
  then
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
    then
    echo "Inserted into teams, " $WINNER
    fi
  fi

  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  if [[ -z $OPPONENT_ID ]]
  then
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
    echo "Inserted into teams, " $OPPONENT
    fi
  fi

  # Handle games
  if [[ $WINNER_GOALS == 0 ]]
  then
    WINNER_GOALS="0"
  fi
  if [[ $OPPONENT_GOALS == 0 ]]
  then
    OPPONENT_GOALS="0"
  fi
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
  echo "Inserted into games, $YEAR, $ROUND, $WINNER, $OPPONENT"
  fi
fi
done
