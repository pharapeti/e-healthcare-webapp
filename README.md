# e-healthcare-webapp


## Installation
1. Pull repo `git clone https://github.com/pharapeti/e-healthcare-webapp.git`
2. Install [rvm](https://rvm.io/)
3. Using rvm, install Ruby. Ensure you install the same version as the one specified in the **Gemfile**
4. In command prompt, run `gem install bundler`
4. Navigate to cloned directory and run `bundle install`. This will install the gem dependencies of the project
5. Run `rake db:drop db:create db:migrate db:seed` to create the database, migrations and create fixtures for testing.
6. Run `rails server` in command prompt to start the project.
7. Open a web browser and navigate to `localhost:3000` to see the homepage

## Contributors also known as Team 6:
* Patrice Harapeti
* Steven Zacherl
* Johan Do
* Justin Carlino
* Yunwei Zhang
