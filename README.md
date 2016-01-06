# README #

This is a basic RoR application for a veterinary system tracking doctors, customers, pets and appointments.

### Requirements ###

* rvm
* ruby-2.2.0
* rails 4.2.0

### Setup ###

    \curl -sSL https://get.rvm.io | bash # Installs rvm
    rvm install 2.2.0 # Installs ruby 2.2.0
    gem install bundler # Installs bundler
    cd veterinary_system # cd into the project dir. rvm should switch to ruby 2.2.0 and create a gemset by the name 'veterinary_system'
    bundle install # Install gems listed in the Gemfile (and dependencies)
    bundle exec rake db:setup # Creates database, loads schema and seeds the database. *** Make sure to add the appropriate database credentials in config/database.yml ***
    bundle exec rails s 
### How to run the tests? ###

    bundle exec rake spec
