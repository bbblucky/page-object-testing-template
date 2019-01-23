# Page-object-testing-template
End-to-end testing template using Page Object. 

It uses Capybara as the testing framework, SitePrism as the page object Model DSL. It also uses dotenv for environment variables handling and Rake for seeding test data.

It uses Google as a example, and the page object includes the basic search input box and search button, the result page, etc. The sample tests include: `verify google search result for test` and `no result for ......`.

## Getting started 
1. Install ruby 2.5.1 or change the ruby version in .ruby-version and Gemfile to your local version
1. Install bundler: `gem install bundler`
1. Install dependencies: `bundler install`
1. Run sample tests for Google search function: `rspec`

You should add the page object to the lib/pages directory, the tests to to the spec/features directory, and the seeding data to lib/tasks/seeding.
Remember to add the environment variables to the .env file.   

## Question?
For the usage of page object, please check the document of SitePrism https://github.com/natritmeyer/site_prism.

For the usage of Capybara, please check the its repo document https://github.com/teamcapybara/capybara. You can also find the cheating sheet of Capybara in https://devhints.io/capybara. 

For the usage of dotenv, please check the its repo document https://github.com/bkeepers/dotenv.




