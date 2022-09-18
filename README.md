# Real Fevr

As part of this [challenge](https://realfevr.github.io/challenge/).

## Environment files

| name              | environment | description                                                       |
| ----------------- | ----------- | ----------------------------------------------------------------- |
| DATABASE_HOST     | all         | database location ip to use in `config/database.yml`              |
| DATABASE_PORT     | all         | database location port to use in `config/database.yml`            |
| DATABASE_NAME     | all         | database according to environment to use in `config/database.yml` |
| DATABASE_USERNAME | all         | username to use database to use in `config/database.yml`          |
| DATABASE_PASSWORD | all         | password to use database to use in `config/database.yml`          |

**Development** and **Test** environments have default values.

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

[ ] Task responsible for deleting notifications older then one week

[+] User should be notified when a notification for the players he subscribed is triggered

#### Bonus

[ ] Sorting on player’s listing based on position, nationality or age

[ ] Players listing pagination

[ ] Endpoints documentation
