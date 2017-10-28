Feature: test login function
#This is how background can be used to eliminate duplicate steps
  Background:
    Given I am on Daugianhanh login page

#Scenario with valid username and password
  Scenario:
    When I enter username as "dada"
    And I enter password as "123456"
    And I click login
    Then Should be success

#Scenario with invalid username and password
  Scenario:
    When I enter username as "abcdef"
    And I enter password as "654321"
    And I click login
    Then Should be fail