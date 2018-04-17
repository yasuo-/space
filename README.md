# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## install

use docker
1. build
```
$ docker-compose build
```
2. up
```
$ docker-compose up
```

3. db create
```
$ docker-compose run web rails db:create
```

4. db migrate
```
$ docker-compose run web rails db:migrate
```

5. View the Rails page

``` http://localhost:3000 ```

* ...
