var seleniumWebdriver = require('selenium-webdriver');
var {defineSupportCode} = require('cucumber');
var app = require('../../app');
var until = seleniumWebdriver.until;
defineSupportCode(function({Given, When, Then}) {
    //Sign up function
    var repassword, username, password;
    var email, name, address, dob;
    var captcha = "";
    var timeout = 0;

    Given('I am on Daugianhanh sing up page', function () {
        return this.driver.get('http://localhost:3000/account/register');
    });

    When('I enter new username as {string}', function (text) {
        username = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtUsername'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter new password as {string}', function (text) {
        password = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtPWD'}).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter new password again as {string}', function (text) {
        repassword = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtCPWD'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter email as {string}', function (text) {
        email = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtEmail'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter name {string}', function (text) {
        name = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtName'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter address as {string}', function (text) {
        address = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtAddress'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter name as {string}', function (text) {
        name = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtName'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter date of birth as {string}', function (text) {
        dob = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtDOB'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I click show captcha', function () {
        var driver = this.driver;
        return this.driver.findElement({id: 'btnShowCaptcha'}, ).then(function(element) {
            return element.click().then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter valid captcha', function () {
        var driver = this.driver;
        return driver.findElement({id: 'txtCaptchaCode'}, ).then(function(element) {
            return driver.findElement({id: 'txtCaptcha'}).then(function (item) {
                return item.getText().then(function (text) {
                    var a = text.toString().match(/\d+/g);
                    captcha = a[0] - (-a[1]);
                    return element.sendKeys(captcha).then(function () {
                        return driver.sleep(timeout);
                    });
                });
            });
        });
    });

    When('I enter invalid captcha', function () {
        var driver = this.driver;
        return driver.findElement({id: 'txtCaptchaCode'}, ).then(function(element) {
            return element.sendKeys("").then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I click sign up', function () {
        var driver = this.driver;
        var t = this;
        return driver.findElement({id: 'btnSignUp'}, ).then(function(element) {
            element.sendKeys();
            return element.click();
        });
    });

    When('I refresh register page', function () {
        var driver = this.driver;
        return driver.navigate().to("http://localhost:3000/account/register");
    });

    Then('Should be sign up successfully', function () {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return driver.wait(until.elementLocated({id: 'msg'}), 5000).then(function () {
            return driver.findElement({id: 'msg'}, ).then(function (element) {
                return element.getText().then(function (value) {
                    if(value.toString().indexOf("Success! Đăng ký thành công.") == -1)
                    {
                        return promise.rejected(Error("Fail"));
                    }
                    return value;
                }).then(function (value) {
                    console.log(value);
                });
            });
        });
    });

    Then('Should be sign up fail', function () {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return driver.wait(until.elementLocated({id: 'msg'}), 5000).then(function () {
            return driver.findElement({id: 'msg'}, ).then(function (element) {
                return element.getText().then(function (value) {
                    if(value.toString().indexOf("Success! Đăng ký thành công.") != -1)
                    {
                        return promise.rejected(Error("Fail"));
                    }
                    return value;
                }).then(function (value) {
                    console.log(value);
                    return true;
                });
            });
        }).catch(function () {
            console.log("Nhập thông tin không đúng hoặc thiếu thông tin.\n");
        });
    });
});