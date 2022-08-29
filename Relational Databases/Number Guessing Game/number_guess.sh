#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generates a random number between 1:1000.
target_number=$((1 + $RANDOM % 1000))

# Get username
echo "Enter your username:"
read username

# Check db for username
username_result=$($PSQL "SELECT username FROM users WHERE username='$username'")
if [[ -z $username_result ]]
then
  # User not in db
  echo "Welcome, $username! It looks like this is your first time here."
  # Insert missing user into db.
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$username')")
  if [[ $INSERT_RESULT != "INSERT 0 1" ]]
  then
    echo "Username insert failed"
    exit
  fi
  # Set user_id
  user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
elif [[ $username == $username_result ]]
then
  # User already in db
  user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
  games_played=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$user_id")
  best_game=$($PSQL "SELECT MIN(score) FROM games WHERE user_id=$user_id")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

# Guessing game
guess_count=0
echo "Guess the secret number between 1 and 1000:"
read guess
guess_count=$((guess_count + 1))
while ! [[ $guess =~ (^[0-9]+$) ]]
do
  echo "That is not an integer, guess again:"
  read guess
done
while [[ $guess != $target_number ]]
do
  if [[ $guess -lt $target_number ]]
  then
    echo "It's higher than that, guess again:"
    read guess
    guess_count=$((guess_count + 1))
    while ! [[ $guess =~ (^[0-9]+$) ]]
    do
      echo "That is not an integer, guess again:"
      read guess
    done
  elif [[ $guess -gt $target_number ]]
  then
    echo "It's lower than that, guess again:"
    read guess
    guess_count=$((guess_count + 1))
    while ! [[ $guess =~ (^[0-9]+$) ]]
    do
      echo "That is not an integer, guess again:"
      read guess
    done
  fi
done
echo "You guessed it in $guess_count tries. The secret number was $target_number. Nice job!"
# Write game to database
INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, score) VALUES($user_id, $guess_count)")
if [[ $INSERT_RESULT != "INSERT 0 1" ]]
then
  echo "Game insert failed"
  exit
fi
