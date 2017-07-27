var fs = require('fs'),
    util = require('util'),
    exec = require('child_process').exec,
    json = JSON.parse(fs.readFileSync('data.json'));

function puts(error, stdout, stderr){console.log(stdout, stderr)}

for (var i in json.array){
    exec('echo '+json.array[i], puts);
}