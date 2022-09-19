# Real Fevr

As part of this [challenge](https://realfevr.github.io/challenge/).

**Disclaimer:** Front-end (Angular) app still not implemented. Just the boilerplate!

## Users

There are 2 users (basic and admin). Please check db/users.rb to get e-mail and password for login.

## Addresses

### API

http://localhost:3000/api/v1/...

### Front-end

http://localhost:4200/...

## Useful commands

### Run just API server

```shell
$ docker-compose -f docker-compose.dev.yml up --build
```

### Run API tests

```shell
$ docker-compose -f docker-compose.test.yml up --build
```

### Run API + Client

Not work properly, yet.

```shell
$ docker-compose up --build
```

## Environment files

| name              | environment | description                                                       |
| ----------------- | ----------- | ----------------------------------------------------------------- |
| DATABASE_HOST     | all         | database location ip to use in `config/database.yml`              |
| DATABASE_PORT     | all         | database location port to use in `config/database.yml`            |
| DATABASE_NAME     | all         | database according to environment to use in `config/database.yml` |
| DATABASE_USERNAME | all         | username to use database to use in `config/database.yml`          |
| DATABASE_PASSWORD | all         | password to use database to use in `config/database.yml`          |

Exceptionally, **Development** and **Test** environments have default values.

---

## Troubleshooting

- If sidekiq dies the first time you run any `docker-compose up --build`, wait until api install, then run `docker-compose up --build` once again

---

## Endpoints

### Notifications

- **GET http://localhost:3000/api/v1/notifications** to list notifications
- **POST http://localhost:3000/api/v1/notifications** to create a notification, giving **player_id** and **message**
- **DELETE http://localhost:3000/api/v1/notifications/:id** to remove a given notification based on its **id**

### Players

- **POST http://localhost:3000/api/v1/players/:player_id/subscribe** to subscribe to notification for a given player, where **player_id** is mandatory
- **GET http://localhost:3000/api/v1/players?page=:page&per_page=:per_page&order_by=:position** to list players, where **page**, **per_page** and **order_by** (birthdate, nationality an position) can be optionally defined
- **GET http://localhost:3000/api/v1/players/:id** show a given player
- **POST http://localhost:3000/api/v1/players/** to create a player, giving birthdate, name, nationality, number and position
- **PUT http://localhost:3000/api/v1/players/:id** to update a given player
- **DELETE http://localhost:3000/api/v1/players/:id** to delete a given player

---

## Requirements

[+] API

[ ] Front-End using React

### API

#### Endpoints

[+] CRUD endpoints for player

[+] CRUD endpoints for notifications

[+] Subscribing notifications

#### Models

[+] Player model

[+] Notification model

#### Tasks

[+] Task that is responsible for fetching information regarding to players and updating them on DB

[+/-] Task responsible for deleting notifications older then one week

[+] User should be notified when a notification for the players he subscribed is triggered

#### Bonus

[+] Sorting on player’s listing based on position, nationality or age

[+] Players listing pagination

[ ] Endpoints documentation

---

## Future improvements

- Allow to sort players DESC
- Implement proper logout
- Use framework for proper endpoints documentation
- Remove the code smell that avoids to test a feature with Rails integration
- Add specs to features that depends of Redis and Sidekiq
- Fix task responsible for deleting notifications older then one week, since it is registered but it is not running
