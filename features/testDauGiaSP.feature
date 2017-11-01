Feature: test chức năng đấu giá
#This is how background can be used to eliminate duplicate steps
  Background:
    Given I am on Daugianhanh login page

#Scenario đấu giá sản phẩm với số tiền bé hơn tiền mua ngay
  Scenario: TC_DG_1
    When I enter username as "Dadawind"
    And I enter password as "123456"
    And I click login
    And I go to detail product page of product id as "17"
    And I click Dau gia
    Then Should be to the auction successfully

#Scenario đấu giá sản phẩm với số tiền lớn hơn tiền mua ngay
  Scenario: TC_DG_2
    When I enter username as "Dadawind"
    And I enter password as "123456"
    And I click login
    And I go to detail product page of product id as "17"
    And I book price as "4000000"
    And I click Dau gia
    Then Should be to the auction successfully and end