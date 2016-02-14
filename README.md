# Cookbook
  Cookbook is a very simple rails application created to provide REST API for
  frontend AngularJS application.


## Technology stack
| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.2.4 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 4.2.4 |
| [PostgreSQL](http://www.postgresql.org/) | 9.5.1 |


## Setup

Follow these steps to setup the application:

#### Step 0: get the source code
```
$ git clone git@github.com:przemkow/cookbook-rails-api.git
```

#### Step 1: Install gems
```
$ bundle install
```

#### Step 2: Copy database
Create a renamed copy of the `database.yml.example` file in the `config` folder.
```
  $ cp config/database.yml.example config/database.yml
```

#### Step 3: Create database and run migrations
```
$ rake db:setup
```
