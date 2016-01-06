# README #

This is a basic RoR application for a veterinary system tracking doctors, customers, pets and appointments.

### Requirements ###

* rvm
* ruby-2.2.0
* rails 4.2.0

### Instructions ###
* Install rvm

        \curl -sSL https://get.rvm.io | bash
* Install ruby 2.2.0        
 
        rvm install 2.2.0
* Install bundler
    
        gem install bundler
* cd into the project directory. rvm should switch to ruby 2.2.0 and create a gemset by the name 'veterinary_system'

        cd veterinary_system
* Install gems listed in the Gemfile (and dependencies)

        bundle install
* Create database, load schema and seed the database. *** Make sure to add the appropriate database credentials in config/database.yml ***
        
        bundle exec rake db:setup
* Run the application
    
        bundle exec rails s 
* Run the rspec specs

        bundle exec rake spec
