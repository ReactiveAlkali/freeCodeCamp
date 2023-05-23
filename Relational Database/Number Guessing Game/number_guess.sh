#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$[$RANDOM % 1000 + 1]

# Prompt the user for their username and retrieve their data
echo "Enter your username:"
read USERNAME
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  IFS="|" read GAMES_PLAYED BEST_GAME  <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# The main game loop
GUESS=-1
NUM_GUESSES=0
echo "Guess the secret number between 1 and 1000:"
while [[ GUESS -ne SECRET_NUMBER ]]
do
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ GUESS -lt SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ GUESS -gt SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  fi
  ((NUM_GUESSES++))
done

# Save the users data
if [[ -z $USER_DATA ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 1, $NUM_GUESSES)")
else
  ((GAMES_PLAYED++))
  if [[ NUM_GUESSES -lt BEST_GAME ]]
  then
    BEST_GAME=$NUM_GUESSES
  fi
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'") 
fi

echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
