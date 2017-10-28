var seleniumWebdriver = require('selenium-webdriver');
var {defineSupportCode} = require('cucumber');
var app = require('../../app');

defineSupportCode(function({Given, When, Then}) {
    var account = {
      username: '',
      password: ''
    };
    var timeout = 500;
    //Login function
    Given('I am on Daugianhanh login page', function() {
        return this.driver.get('http://localhost:3000/account/login');
    });

    When('I enter username as {string}', function (text) {
        account.username = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtUsername'}, ).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I enter password as {string}', function (text) {
        account.password = text;
        var driver = this.driver;
        return this.driver.findElement({id: 'txtPWD'}).then(function(element) {
            return element.sendKeys(text).then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    When('I click login', function () {
        var driver = this.driver;
        return this.driver.findElement({css: 'button[type="submit"]'}).then(function(element) {
            return element.click().then(function () {
                return driver.sleep(timeout);
            });
        });
    });

    Then('Should be success', function () {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return this.driver.getCurrentUrl().then(function (rs) {
            var url = 'http://localhost:3200/testcase/login?username=' + account.username + '&pass=' + account.password + '&result=';
            if(rs.toLowerCase().indexOf("http://localhost:3000/home") != -1)
            {
                return promise.fullyResolved("Pass");
            }
            return promise.rejected("Fail");
        }).then(function (rs) {
            console.log(rs);
        });
    });

    Then('Should be fail', function () {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return this.driver.getCurrentUrl().then(function (rs) {
            var url = 'http://localhost:3200/testcase/login?username=' + account.username + '&pass=' + account.password + '&result=';
            if(rs.toLowerCase().indexOf("http://localhost:3000/home") == -1)
            {
                return promise.fullyResolved("Passed");
            }
            return promise.rejected("Failed");
        }).then(function (rs) {
            console.log(rs);
        });
    });
});