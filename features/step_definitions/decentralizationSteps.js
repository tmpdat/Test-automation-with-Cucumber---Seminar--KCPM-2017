var seleniumWebdriver = require('selenium-webdriver');
var {defineSupportCode} = require('cucumber');
var app = require('../../app');

defineSupportCode(function({Given, When, Then}) {
    var timeout = 0;

    When('I go to profile page of user has id as {string}', function (text) {
        var driver = this.driver;
        return driver.navigate().to("http://localhost:3000/account/profile/" + text).then(function(){
            driver.sleep(timeout);
        });
    });

    When('I go to change pass page of user', function () {
        var driver = this.driver;
        return driver.navigate().to('http://localhost:3000/account/changePassword').then(function () {
            driver.sleep(timeout);
        });
    });

    Then('Should be I am on profile page of user has id as {string}', function (text) {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return driver.getCurrentUrl().then(function (rs) {
            var url = 'localhost:3000/account/profile/' + text;
            if(rs.toLowerCase().indexOf(url) != -1)
            {
                return promise.fullyResolved("Pass");
            }
            return promise.rejected("Fail");
        });
    });

    Then('Should be I am on login page', function () {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return driver.getCurrentUrl().then(function (rs) {
            var url = 'localhost:3000/account/login';
            if(rs.toLowerCase().indexOf(url) != -1)
            {
                return promise.fullyResolved("Pass");
            }
            return promise.rejected("Fail");
        });
    });
});