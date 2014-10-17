'use strict';

// // alternate parsing option
// process.stdin.resume();
// process.stdin.setEncoding('utf8');

// var data = "";

// process.stdin.on('data', function(chunk) {

// 	data += chunk;

// 	for (var i = data.indexOf('\n'); i > 0; i = data.indexOf('\n')) {
// 		var line = data.substr(0,i);
// 		process.stdout.write(JSON.stringify(JSON.parse(line))+"\n", 'utf8');
// 		data = data.substr(i+1); // +1 to lose the newline
// 	}

// });

require('readline').createInterface({
	input: process.stdin,
	output: new require('stream').Writable // devnull
}).on('line', function(line){
	process.stdout.write(JSON.stringify(JSON.parse(line))+"\n");
})