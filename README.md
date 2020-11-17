# FollowUp

Is an application for project management through tickets, you can invite people to your project and assign tasks to them and change the status according to the step of the task.

## Stack

- [Ruby 2.7](https://www.ruby-lang.org/en/documentation/)
- [Rails 6](https://guides.rubyonrails.org/)
- [Stimulus](https://stimulusjs.org/)
- [Stimulus Reflex](https://docs.stimulusreflex.com/)
- [ViewComponents](https://viewcomponent.org/)
- [PostgresQL](https://www.postgresql.org/)

## Dependencies

After clone this project, you need to install the ruby depedencies from your Gemfile running `bundle install` and the javascript dependencies with `yarn install`.

## Database

Next step is create the database (Postgresql) with this command `rails db:create` and execute all the migrations `rails db:migrate`.

## Development

We have two servers, Rails server and Webpack dev server, if you want to run both at once just install Foreman with `foreman start -p 3000`, the flag `-p` indicates the port.

If you prefer run servers individually, for Rails server use `rails s` and for webpack dev server `bin/webpack-dev-server`.
