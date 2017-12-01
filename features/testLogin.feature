Feature: test login function
#This is how background can be used to eliminate duplicate steps
  Background:
    Given I am on Daugianhanh login page

  Scenario Outline:
    When I enter username as "<username>"
    And I enter password as "<password>"
    And I click login
    Then Should be <status>

    Examples:
    |  username |  password  |  status  |
    |    dada   |     123456 |  success |
    |    abcdef |     654321 |  fail    |