Feature: test sign up function
#This is how background can be used to eliminate duplicate steps
  Background:
    Given I am on Daugianhanh sing up page

#Scenario with valid username and password
  Scenario Outline: Sign up
    When I enter new username as "<username>"
    And I enter new password as "<password>"
    And I enter new password again as "<repassword>"
    And I enter email as "<email>"
    And I enter name as "<name>"
    And I enter date of birth as "<birthday>"
    And I enter address as "<address>"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up <status>
Examples:
    |username|password|repassword|email|name|birthday|address|status|
    |dadawind|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|successfully|
    ||123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
    |dada1|123456||wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
    |dada1|123456|123456|wind8673|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
    |dada1|123456|123456|wind8673@gmail.com||01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
    |dada1|123456|123456|wind8673@gmail.com|dat|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
    |dada1|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt||320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
    |dada1|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996||fail|
    |dada1|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|


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
  Scenario Outline: TC_SU_11
    When I enter new username as "<username1>"
    And I enter new password as "<password1>"
    And I enter new password again as "<repassword1>"
    And I enter email as "<email1>"
    And I enter name as "<name1>"
    And I enter date of birth as "<birthday1>"
    And I enter address as "<address1>"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    When I enter new username as "<username2>"
    And I enter new password as "<password2>"
    And I enter new password again as "<repassword2>"
    And I enter email as "<email2>"
    And I enter name as "<name2>"
    And I enter date of birth as "<birthday2>"
    And I enter address as "<address2>"
    And I click show captcha
    And I enter valid captcha
    And I click sign up
    Then Should be sign up <status>
    Examples:
      |username1|password1|repassword1|email1|name1|birthday1|address1|username2|password2|repassword2|email2|name2|birthday2|address2|status|
      |dada1|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|dada1|123456|123456|tmpdat1206@gmail.com|Trương Minh Phát Đạt1|01/01/1997|244 Dương Đình Hội, Quận 9, tp Hồ Chí Minh|fail|
      |dada1|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|dada2|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt1|01/01/1997|244 Dương Đình Hội, Quận 9, tp Hồ Chí Minh|fail|
      |dada1|123456|123456|wind8673@gmail.com|Trương Minh Phát Đạt|01/01/1996|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|dada2|123456|123456|tmpdat1206@gmail.com|Trương Minh Phát Đạt1|01/01/1997|320 Nguyễn Văn Linh, quận 7, tp Hồ Chí Minh|fail|
