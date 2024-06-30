#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read Y R W O WG OG
do
  if [[ $Y != year ]]
  then
    # WINNER TEAM ID
    WI=$($PSQL "SELECT team_id FROM teams WHERE name='$W'")
    if [[ -z $WI ]]
    then
      # INSERT IF WINNER NOT THERE
      IWI=$($PSQL "INSERT INTO teams(name) VALUES ('$W')")
      if [[ $IWI == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $W
      fi
      # GET WINNER ID
      WI=$($PSQL "SELECT team_id FROM teams WHERE name='$W'")
    fi

    # OPPONENT ID
    OI=$($PSQL "SELECT team_id FROM teams WHERE name='$O'")
    if [[ -z $OI ]]
    then
      # INSERT OPPONENT 
      IWI=$($PSQL "INSERT INTO teams(name) VALUES ('$O')")
      if [[ $IWI == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $O
      fi
      # GET OPPONENT ID
      OI=$($PSQL "SELECT team_id FROM teams WHERE name='$O'")
    fi

    IG=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($Y, '$R', $WI, $OI, $WG, $OG)")
    if [[ $IG == "INSERT 0 1" ]]
    then
      echo Inserted into games, $W VS $O
    fi
     
  fi
done