# Sample functional test with PageObject, Capybara+RSpec and API test with Airborne+RSpec

A sample project using FF browser and show test steps on Wikipedia open-source website. API test show on https://jsonplaceholder.typicode.com/. Also I add universal drag'n'drop method based on https://gist.github.com/rcorreia/2362544. I don't use them in this sample test, but this configuration works on my other projects and don't need adaptation to your code. 

Works only at Ruby v5 (because airborne gem). So if you don't have Ruby, my advice is install Homebrew and RVM, then just `rvm install ruby-2.5.1`, like http://railsapps.github.io/installrubyonrails-mac.html  

**Setup**

`git clone https://github.com/oskonstantinov/ruby_sample_test.git`

`cd ruby_sample_test`

`bundle install`

**Execute Specs**

`rspec spec/tests/sample_test_spec.rb`

`rspec spec/tests/api_test.rb`
