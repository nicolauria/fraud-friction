# Fraud Friction

An api that compares a current users location with a list of their previously logged in locations and returns the closest distance  

## Route
The ``` post '/login' ``` route is directed to the sessions_controller create action

## Controller
The **Create** action finds a user using the username and password parameters. It first checks to see if a user is logging in from the same machine they previously logged in from. If so, the distance from their previous login is returned.

If they are logging in from a new location, all of the logins for that user are retrieved and compared with the current location using the **haversine** gem.

## Seed Data
The program was seeded with 3 users and 100 login requests.

## Running the API
1) git clone the repo: ``` git clone https://github.com/nicolauria/fraud-friction.git```<br>
2) navigate to the root of the folder and run ```rails s```

To test the program, download an api tool such as Postman.<br>
Then make a post request using these credentials:<br><br>
username: **gbeadles0**<br>
password: **3n6E3EfSifu**<br>
![using postman](fraud-friction-postman.png?raw=true)

## TODOS
1) Further optimize the performance of the api by keeping track of commonly used
login locations. (allows us to avoid excessive database queries)
