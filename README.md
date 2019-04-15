# README

Ruby version: 2.6.2

# Configuration
Need to have pgcrypto extention to be installed
```
sudo apt-get install postgresql-contrib
```

# Database creation

Create role with an account with sufficient rights:
```
psql -f setup_postgres.sql
```

Create database:
```
rake db:setup
rails db:migrate
```

## Database initialization

# How to run the test suite

```
rspec
```

## Mutant

```
RAILS_ENV=test bundle exec mutant -r ./config/environment --use rspec ClassName
```

# Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

```
mina setup
mina deploy
```

# TODO:
arm fails if castle destroyed !

only YOU or admin can upate an account
=> trailblazer operation should handle all creations with contracts & cie

Add concern to check_user_belongs_to_account?
Add Sidekiq-cron to handle PA regen & Raid attacks

## créer un ansible juste pour ça
apt-get install postgresql-contrib
apt-get install redis
service sidekiq

