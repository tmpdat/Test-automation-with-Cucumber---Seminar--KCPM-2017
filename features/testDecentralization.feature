Feature: test phân quyền
##This is how background can be used to eliminate duplicate steps
#  Background:
#    Given I am on Daugianhanh home page

#Scenario Xác nhận việc phân quyền của xem thông tin người dùng
  Scenario:
    When I am on Daugianhanh login page
    When I enter username as "Dadawind"
    And I enter password as "123456"
    And I click login
    And I go to profile page of user has id as "1"
    Then Should be I am on profile page of user has id as "1"

#Scenario Xác nhận việc phân quyền của chức năng đổi password
  Scenario:
    When I go to change pass page of user
    Then Should be I am on login page