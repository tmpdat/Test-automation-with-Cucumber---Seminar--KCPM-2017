var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('testcase/testcaseLogin', {
        title: 'Kết quả kịch bản',
    });
});

router.get('/login', function(req, res, next) {
    var  username = req.query.username;
    var  password = req.query.pass;
    var rs = req.query.result;
    res.render('testcase/testcaseLogin', {
        title: 'Kết quả kịch bản',
        username: username,
        password: password,
        isSuccess: rs === 'success',
    });
});

module.exports = router;
