Feature: test love product function
  Background:
    Given I am on Daugianhanh login page

Scenario: TC_LP_1
  When I enter username as "Dadawind"
  And I enter password as "123456"
  And I click login
  And I go to the detail page of product that has id as "1"
  And I click the empty heart
  Then Should be the heart is red

Scenario: TC_LP_2
  When I enter username as "Dadawind"
  And I enter password as "123456"
  And I click login
  And I go to the detail page of product that has id as "1"
  And I click the red heart
  Then Should be the heart is empty