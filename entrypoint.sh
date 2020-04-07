#!/usr/bin/env bash

rsync -aqP /monorepo_cache/.yarn/ /monorepo/.yarn/
yarn install
exec "$@"