var webDriver = require('selenium-webdriver');
var {defineSupportCode} = require('cucumber');
var app = require('../../app');

defineSupportCode(function ({Given, When, Then}) {
   var timeout = 1000;

   When('I go to the detail page of product that has id as {string}', function (id) {
       var driver = this.driver;
       return driver.navigate().to('http://localhost:3000/product/detail/' + id).then(function(){
           return driver.sleep(timeout);
       });
   });

   When('I click the empty heart', function () {
      var driver = this.driver;
      return driver.findElement({id: "heart"}).then(function(element){
          return element.click().then(function () {
              return driver.wait(webDriver.until.elementLocated({id: 'remove-love'}), timeout);
          });
      });
   });

    When('I click the red heart', function () {
        var driver = this.driver;
        return driver.findElement({id: "heart"}).then(function(element){
            return element.click();
        });
    });

   Then('Should be the heart is red', function(){
      var driver = this.driver;
       driver.sleep(timeout);
      return driver.findElement({id: 'remove-love'}).then(function (element) {
          return driver.sleep(timeout);
      });
   });

    Then('Should be the heart is empty', function(){
        var driver = this.driver;
        driver.sleep(timeout);
        return driver.findElement({id: 'add-love'}).then(function (element) {
            return driver.sleep(timeout);
        });
    });
});