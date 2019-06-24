var socket = require('nodejs-websocket');
var http = require('http');
var fs = require('fs');

var espNode = {};

http.createServer(function(req, res) {
	if (req.url == '/') {
		res.writeHead(200, {
			'Content-Type': 'text/html'
		});
		res.end(fs.readFileSync('./public/index.html'));
	}
	if (req.url == '/style.css') {
		res.writeHead(200, {
			'Content-Type': 'text/css'
		});
		res.end(fs.readFileSync('./public/style.css'));
	}
	if (req.url == '/script.js') {
		res.writeHead(200, {
			'Content-Type': 'text/javascript'
		});
		res.end(fs.readFileSync('./public/script.js'));
	}
	if (req.url == '/socket.js') {
		res.writeHead(200, {
			'Content-Type': 'text/javascript'
		});
		res.end(fs.readFileSync('./public/socket.js'));
	}
}).listen(8080, function() {
	console.log("server running in port 8080");
});


var server = socket.createServer(function(conn) {
	if (conn.path !== '/') {
		var id = conn.path.substring(1, 6);
		console.log('new connection coming from esp: ' + id);
		espNode[id] = conn;
	} else
		console.log('new connection from client');

	conn.on("text", function(res) {
		console.log(res);
		checkConnection(conn, function(newConn) {
			if (newConn !== false) {
				console.log(newConn);
			} else {
				var data = JSON.parse(res);
				console.log(data);
				checkID(data.led, function(connection) {
					if (connection !== false) {
						var value = data.value;
						connection.sendText(value.toString());
					} else {
						data.value = "connection was not establish";
						conn.sendText(JSON.stringify(data));
					}
				});
			}
		})
	})
	conn.on('close', function(code, reason) {
		console.log('connection close');
	})
	conn.on('error', function(err) {
		console.log(err);
	})
}).listen(8888, function() {
	console.log("socket running in port 8888");
});

var checkID = function(id, done) {
	var conn = espNode[id];
	if (conn !== undefined) {
		console.log("id established");
		done(conn);
	} else {
		console.log("no id");
		done(false);
	}

}

var checkConnection = function(conn, done) {
	espClient = false;
	for (key in espNode) {
		if (conn === espNode[key]) {
			espClient = key;
			break;
		}
	}
	done(espClient);
}
