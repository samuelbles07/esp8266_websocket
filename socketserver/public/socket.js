var ip = "192.168.43.82";
// var ip = "127.0.0.1";
var conn = new WebSocket('ws://' + ip + ':8888');

conn.onmessage = function(result) {
	console.log(result);
	var data = JSON.parse(result);
	if (data.led == 'blink') {
		blinkReturn.innerHTML = data.value;
	} else if (data.led == 'dim') {
		dimReturn.innerHTML = data.value;
	} else if (data.led == 'rgb') {
		rgbReturn.innerHTML = data.value;
	}
}
