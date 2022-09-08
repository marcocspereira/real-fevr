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

## Useful commands

### Run tests

```shell
# without docker-compose
$ rspec

# using docker-compose with real_fevr_test container
$ docker-compose run real_fevr_test rspec
```
