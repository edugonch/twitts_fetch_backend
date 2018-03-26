# README

# Project Title

Twitter fetch backend

### Prerequisites

You need this software to install the project

1) Ruby 2.5
2) Rails 5.1.5
3) PostgreSQL + Devtools
4) NodeJs
5) Redis
6) Foreman

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.


### Installing

A step by step series of examples that tell you have to get a development env running

1) Clone the repo at https://github.com/edugonch/twitts_fetch_backend
2) Run bundle install
```
bundle install
```
3) Create the database
```
rake db:create
```
4) Migrate the database
```
rake db:migrate
```
5) Run the seeds to create the test user
```
rake db:seed
```
5) Run the application with the workers
```
foreman start -f Procfile.dev
```

## Running the tests

I'm using minitest to make the tests.

You can run the test with 
```
rails test
```

## Built With

* [RubyOnRails](http://rubyonrails.org/) - The web framework used
* [PostgreSql](https://www.postgresql.org/) - Database Engine
* [Sidekiq](https://github.com/mperham/sidekiq) - Background Jobs
* [SidekiqScheduler](https://github.com/moove-it/sidekiq-scheduler) - Scheduler for Sidekiq
* [Swaggard](https://github.com/adrian-gomez/swaggard) - Implementation of swagger for rails
* [RubyJwt](https://github.com/jwt/ruby-jwt) - Ruby implementation of JSON Web Token 

## Authors

* **Eduardo González** - *Initial work* - [edugonch](https://github.com/edugonch)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

You can see it live running at: 
* [SwaggerApi](https://boiling-meadow-32308.herokuapp.com/api_docs/swagger)
* [SidekiqPanel](https://boiling-meadow-32308.herokuapp.com/sidekiq/)


