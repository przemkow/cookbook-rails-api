# Cookbook
  Cookbook is a very simple rails application created to provide REST API for
  frontend AngularJS application.


## Technology stack
| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.2.4 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 4.2.4 |
| [PostgreSQL](http://www.postgresql.org/) | 9.5.1 |

#### Other tools:

  [Devise](https://github.com/plataformatec/devise/tree/v4.0.0.rc1) v4.0.0.rc1

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
## Available methods:

#### User
```
POST        /api/users      create
GET         /api/users/:id  show
PATCH/PUT   /api/users/:id  update
DELETE      /api/users/:id  destroy
```

Expected parameters for create and update:

```json
{
  "user" : {
    "email" : "tom26@example.com",
    "password" : "Vo1dem0rt",
    "password_confirmation" : "Vo1dem0rt",
    "first_name" : "Tom",
    "last_name" : "Riddle",
    "about" : "Hello. My name is Tom Riddle"
  }
}
```

In response you will get "auth_token" which you can use to authenticate during current session.

> !!! Call on "update" and "destroy" will always affect current user!

#### Session
```
POST        /api/sessions                create
DELETE      /api/sessions/:auth_token    destroy
```

Expected parameters for creating a new session:

```json
{
  "session" : {
    "email" : "tom26@example.com",
    "password" : "Vo1dem0rt",
  }
}
```

In response you will get new "auth_token" assigned to user.
Calling method destroy deactivate passed auth_token.

#### Recipe
```
GET         /api/recipes       all recipes
POST        /api/recipes       create
GET         /api/recipes/:id   show
PATCH/PUT   /api/recipes/:id   update
DELETE      /api/recipes/:id   destroy
```

Expected parameters for create and update:

```json
{
    "recipe" : {
        "name" : "Chocolate frog",
        "description" : "sorry, it's only an example :(",
        "preparation_time_in_min" : "30"
    }
}
```

#### Favourites
```
GET    /api/users/:user_id/favourites              all user favourites
POST   /api/users/:user_id/favourites              add recipe to favourites
DELETE /api/users/:user_id/favourites/:recipe_id   delete recipe from favourites
```

Expected parameters for adding recipe to user's favourites list:

```json
{
    "favourite" : {
        "recipe_id" : "1"
    }
}
```
