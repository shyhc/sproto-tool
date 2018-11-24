let sproto = require(".././sproto");
let fs = require("fs");
let md5 = require("./md5");
let request = require('request');

// 读取协议二进制文件
function readBinary(filename) {
    let buffer = fs.readFileSync(filename);
    if (!buffer) {
        console.log("not found file(" + filename + ")");
    }
    return buffer;
}

// client request
let client = sproto.createNew(readBinary("s2c_http_luser.spb"));
let clientHost = client.host();
let clientSender = clientHost.attach(sproto.createNew(readBinary("c2s_http_luser.spb")));

//client send request
let GAME_MD5_SALT = "8yUW9mXq6D49A"
let session = 0
let body = clientSender("luser_register", {}, session);
let url = "/pb?sign=" + md5.hex_md5(body+GAME_MD5_SALT);
//console.log(url);

request({
    url:url,
    method:"POST",
    body:body,
}, function(error, response, body) {
    if (!error && response.statusCode == 200) {
        console.log(body)
    }
});

