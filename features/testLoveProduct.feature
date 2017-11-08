Feature: test love product function
  Background:
    Given I am on Daugianhanh login page
    When I enter username as "Dadawind"
    And I enter password as "123456"
    And I click login
#Scenario: TC_LP_1
#  And I go to the detail page of product that has id as "1"
#  And I click the empty heart
#  Then Should be the heart is red
#
#Scenario: TC_LP_2
#  And I go to the detail page of product that has id as "2"
#  And I click the empty heart
#  And I click the red heart
#  Then Should be the heart is empty
#
#Scenario: TC_LP_3
#  And I go to the detail page of product that has id as "3"
#  And I click the empty heart
#  And I click my name
#  And I click my favorite products
#  Then Should be to show product that has id as "3"

Scenario: TC_LP_4
  And I go to the detail page of product that has id as "3"
  And I click the empty heart
  And I click my name
  And I click my favorite products
  And I remove product that has id is "3" from my favorite products
  Then Should not be to show product that has id as "3"