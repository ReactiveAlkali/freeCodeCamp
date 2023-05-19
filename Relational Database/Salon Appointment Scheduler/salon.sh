#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

MAIN_MENU() {
  # display the opening message of the menu
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # display a numbered list of services offered
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
    SERVICE_IDS+=($SERVICE_ID)
    SERVICE_NAMES+=("$SERVICE_NAME")
  done <<< $(echo "$SERVICES")
  echo ${SERVICE_NAMES[*]}

  # get and verify the service ID from the customer
  read SERVICE_ID_SELECTED
  VALID_ID=false
  for i in "${!SERVICE_IDS[@]}"
  do
    if [[ "${SERVICE_IDS[$i]}" = "$SERVICE_ID_SELECTED" ]]
    then
      MAKE_APPOINTMENT $SERVICE_ID_SELECTED "${SERVICE_NAMES[$i]}"
      VALID_ID=true
      break
    fi
  done

  # start again if the given ID was invalid
  if [[ $VALID_ID = false ]]
  then
    MAIN_MENU "Sorry, I could not find that service. What would you like today?"
  fi
}

MAKE_APPOINTMENT() {
  SERVICE_ID=$1
  SERVICE_NAME="$2"

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # get customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | sed -E 's/^ *| *$//g')
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number. What is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # add the appointment
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

echo -e "\n~~~~~ SALON SODIUM ~~~~~\n\nWelcome to Salon Sodium, how can I help you?\n"
MAIN_MENU
