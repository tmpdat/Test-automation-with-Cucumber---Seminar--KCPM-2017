var seleniumWebdriver = require('selenium-webdriver');
var {defineSupportCode} = require('cucumber');
var app = require('../../app');

defineSupportCode(function({Given, When, Then}) {
    var oldPrice;
    var timeout = 0;

    When('I go to detail product page of product id as {string}', function (id) {
        var driver = this.driver;
        return this.driver.get('http://localhost:3000/product/detail/' + id).then(function () {
            driver.sleep(timeout);
        });
    });

    When('I click Dau gia', function () {
        var driver = this.driver;
        var key = driver.Key;
        return driver.findElement({id: 'btnDG'}).then(function (element) {
            driver.findElement({id: 'txtQ'}).then(function(curPrice){
                curPrice.getAttribute('value').then(function(value){
                    oldPrice = value;
                });
            });
            element.sendKeys("");
            return element.click().then(function () {
                driver.sleep(timeout);
                return driver.switchTo().alert().accept().then(function(){
                    return driver.sleep(4*timeout);
                });
            });
        });
    });

    When('I book price as {string}', function(text){
       var driver = this.driver;
       return driver.findElement({id: 'txtQ'}).then(function(curPriceEle){
           curPriceEle.clear();
           return curPriceEle.sendKeys(text).then(function () {
              return driver.sleep(timeout);
           });
       });
    });

    Then('Should be to the auction successfully', function () {
       var driver = this.driver;
       var promise = seleniumWebdriver.promise;
       return driver.findElement({id: 'txtStep'}).then(function(deltaPriceEle){
           return driver.findElement({id: 'txtQ'}).then(function(curPriceEle)
           {
               var deltaPrice, curPrice, price;
               return deltaPriceEle.getAttribute('value').then(function(v){
                  return curPriceEle.getAttribute('value').then(function(v1){
                      price = oldPrice - (-v);
                      if(price == v1)
                      {
                          return promise.fullyResolved(true);
                      }
                      return promise.rejected(Error('Fail'));
                  });
               });
           });
       });
    });

    Then('Should be to the auction successfully and end', function () {
        var driver = this.driver;
        var promise = seleniumWebdriver.promise;
        return driver.findElement({id: 'txtQ'}).then(function(curPriceEle)
        {
            return promise.rejected(Error('Fail'));
        }).catch(function () {
            return promise.fullyResolved(true);
        });
    });
});