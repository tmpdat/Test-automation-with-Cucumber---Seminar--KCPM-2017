Feature: test sign up function
#This is how background can be used to eliminate duplicate steps
  Background:
    Given I am on Daugianhanh sing up page

#Scenario with valid username and password
  Scenario: TC_SU_1
    When I enter new username as "dada"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "gao3678@gmail.com"
    And I enter name as "Trương Minh Phát Đạt0"
    And I enter date of birth as "01/01/1996"
    And I enter address as "Sơn Mỹ, Hàm Tân, Bình Thuận"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up successfully

#Scenario Verify sign up with empty username
  Scenario: TC_SU_2
    When I enter new username as ""
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with password not same to repassword
  Scenario: TC_SU_3
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as ""
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with empty email
  Scenario: TC_SU_4
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as ""
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with invalid email
  Scenario: TC_SU_5
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with empty name
  Scenario: TC_SU_6
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as ""
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with length of name is less 4 letters
  Scenario: TC_SU_7
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "dat"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with empty date of birth
  Scenario: TC_SU_8
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as ""
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with empty address
  Scenario: TC_SU_9
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as ""
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with invalid captcha
  Scenario: TC_SU_10
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter invalid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with two same usernames
  Scenario: TC_SU_11
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    And I refresh register page
    And I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "tmpdat1206@gmail.com"
    And I enter name as "Trương Minh Phát Đạt1"
    And I enter date of birth as "01/01/1997"
    And I enter address as "244 Dương Đình Hội, Quận 9, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with two same emails
  Scenario: TC_SU_12
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    And I refresh register page
    And I enter new username as "dada2"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt1"
    And I enter date of birth as "01/01/1997"
    And I enter address as "244 Dương Đình Hội, Quận 9, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail

  #Scenario Verify sign up with two same addresses
  Scenario: TC_SU_13
    When I enter new username as "dada1"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "wind8673@gmail.com"
    And I enter name as "Trương Minh Phát Đạt"
    And I enter date of birth as "01/01/1996"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    And I refresh register page
    And I enter new username as "dada2"
    And I enter new password as "123456"
    And I enter new password again as "123456"
    And I enter email as "tmpdat1206@gmail.com"
    And I enter name as "Trương Minh Phát Đạt1"
    And I enter date of birth as "01/01/1997"
    And I enter address as "320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up fail