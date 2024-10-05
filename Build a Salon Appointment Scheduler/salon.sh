#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICES() {
  QUERY_SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$QUERY_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] 
  then
    SERVICE_ID=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_ID ]] 
    then
      echo -e "\nI could not find that service. What would you like today?"
      SERVICES
    else
      CREATE_APPOINTMENT $SERVICE_ID
    fi
  else
    echo -e "\n Invalid service id. Please input again."
    SERVICES
  fi
}

CREATE_APPOINTMENT() {
  SERVICE_ID=$1

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID;")

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # find customer 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  # if not found
  if [[ -z $CUSTOMER_ID ]]
  then
    # ask name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # save customer info
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
  fi

  # ask time
  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/ //'), $CUSTOMER_NAME?"
  read SERVICE_TIME

  CREATE_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/ //') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/ //')."
}

SERVICES

