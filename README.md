# Real Fevr

As part of this [challenge](https://realfevr.github.io/challenge/).

## Useful commands

### Run just API

```shell
# without docker-compose
$ rails s -p 3000 -b 0.0.0.0
# using docker-compose with real_fevr_api container
$ docker-compose -f docker-compose.dev.yml up --build
```

### Run tests

```shell
# without docker-compose
$ rspec
# using docker-compose with real_fevr_test container
$ docker-compose -f docker-compose.test.yml up --build
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

## Requirements

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
