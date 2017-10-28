var {defineSupportCode} = require('cucumber');

defineSupportCode(function({After}) {
    After(function() {
        var driver = this.driver;
        driver.sleep(200);
        return driver.quit();
    });
});