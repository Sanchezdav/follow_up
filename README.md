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

## Screenshots

### Board

![Board](https://user-images.githubusercontent.com/5151682/104401534-ffdaba00-5519-11eb-8df8-5bae732f8978.png)

### Task view

![Task](https://user-images.githubusercontent.com/5151682/104401860-a8891980-551a-11eb-8d55-eb518eb0c269.png)

### Task Comments

![Comments](https://user-images.githubusercontent.com/5151682/104401900-bf2f7080-551a-11eb-9cbc-b6af17900026.png)

### New task modal

![New](https://user-images.githubusercontent.com/5151682/104401949-d79f8b00-551a-11eb-8baf-0f2ee3216a2c.png)

### Admin

![Admin](https://user-images.githubusercontent.com/5151682/104401988-ea19c480-551a-11eb-9538-e35efde3627a.png)

### Sign Up

![SignUp](https://user-images.githubusercontent.com/5151682/104402050-0a498380-551b-11eb-825a-8456ae219e14.png)

### Sign In

![SignIn](https://user-images.githubusercontent.com/5151682/104402089-22b99e00-551b-11eb-9cb8-cf0f945b67bc.png)
