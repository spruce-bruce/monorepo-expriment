# HELLO
This is my monorepo experiment repo. Things I'm doing:
1. Uses pm2 to manage my various processes.
1. Uses docker and docker-compose to create a database, redis server and elastic search server
1. Hapi node api with no routes yet
1. Create React App frontend

## Deps
- install yarn
- install docker
- install pm2

## Start
clone the project then

```
yarn install
pm2 start ecosystem.config.js
```
