PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

count=$($PSQL "SELECT COUNT(*) FROM elements")

for i in $(seq $count)
do
  element_name=$($PSQL "SELECT symbol FROM elements LIMIT 1 OFFSET $(($i - 1))")
  lower_element_name="${element_name,,}"
  upper_element_name="${lower_element_name^}"
  update=$($PSQL "UPDATE elements SET symbol='$upper_element_name' WHERE symbol='$element_name'")
  if [[ $update == "UPDATE 1" ]]
  then
    echo "Updated"
  fi
done
