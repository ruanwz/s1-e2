Feature: Manage repositories
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new repository
    Given I am on the new repository page
    When I fill in "Name" with "name 1"
    And I fill in "User" with "user_id 1"
    And I fill in "Type" with "type 1"
    And I fill in "Fork by" with "fork_by 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "user_id 1"
    And I should see "type 1"
    And I should see "fork_by 1"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  Scenario: Delete repository
    Given the following repositories:
      |name|user_id|type|fork_by|
      |name 1|user_id 1|type 1|fork_by 1|
      |name 2|user_id 2|type 2|fork_by 2|
      |name 3|user_id 3|type 3|fork_by 3|
      |name 4|user_id 4|type 4|fork_by 4|
    When I delete the 3rd repository
    Then I should see the following repositories:
      |Name|User|Type|Fork by|
      |name 1|user_id 1|type 1|fork_by 1|
      |name 2|user_id 2|type 2|fork_by 2|
      |name 4|user_id 4|type 4|fork_by 4|
