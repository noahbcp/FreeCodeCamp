#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# Function to print a numbered list of services
PRINT_SERVICES () {
  LENGTH_SERVICES=$($PSQL "SELECT COUNT(service_id) FROM services")
  for i in $(seq 1 $LENGTH_SERVICES)
  do
    SERVICE_ID=$($PSQL "SELECT service_id FROM services LIMIT 1 OFFSET $(($i - 1))")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")
    echo $SERVICE_ID") "$SERVICE_NAME
  done
}

# Handle printing services & reading customer data
PRINT_SERVICES
read SERVICE_ID_SELECTED
ALL_SERVICE_IDS=$($PSQL "SELECT service_id FROM services")
# Loop to reprint services if a service that does not exist is selected
while ! grep "$SERVICE_ID_SELECTED" <<< "$ALL_SERVICE_IDS"
do
  PRINT_SERVICES
  read SERVICE_ID_SELECTED
done
read CUSTOMER_PHONE
CUSTOMER_PHONE_EXISTS=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_PHONE_EXISTS ]] # Only prompt for customer name if customer's phone is not in database
then
  read CUSTOMER_NAME
fi
read SERVICE_TIME

# Add customer if not in database
if [[ -z $CUSTOMER_PHONE_EXISTS ]]
then
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted into customers, " $CUSTOMER_NAME
  fi
fi

# Add appointment into database
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
then
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo "I have put you down for a" $SERVICE_NAME "at" $SERVICE_TIME"," $CUSTOMER_NAME"."
fi
