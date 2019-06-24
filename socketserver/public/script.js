var blinkInput = document.getElementById("blinkIn"),
	blinkSubmit = document.getElementById("blinkSub"),
	blinkReturn = document.getElementById("blinkRet");

blinkSubmit.addEventListener('click', function() {
	var data = {
		led: "blink",
		value: blinkInput.value
	}
	// console.log(JSON.stringify(data));
	conn.send(JSON.stringify(data)); // send through socket using json
});

var dimValue = document.getElementById("dimVal"),
	dimRange = document.getElementById("dimRan"),
	dimReturn = document.getElementById("dimRet"),
	switchStat = true;
// dimSwitch = document.getElementById("dimSw"),

// dimSwitch.addEventListener('click', function() {
//     var data = {
//         led: "dim",
//         status: "switch"
//     };
//     if (switchStat == true) {
//         data.value = "on"; // data hidup
//         dimSwitch.innerHTML = "Matikan! ";
//         switchStat = false;
//     } else {
//         data.value = "off"; // data mati
//         dimSwitch.innerHTML = "Hidupkan! ";
//         switchStat = true;
//     }
//     dimReturn.innerHTML = data.value;
//     // console.log(JSON.stringify(data));
//     conn.send(JSON.stringify(data));
// });

dimRange.addEventListener('input', function() {
	var value = convertBit(this.value, 100);
	dimValue.innerHTML = this.value;
	var data = {
		led: "dim",
		value: value
	};
	// console.log(JSON.stringify(data));
	conn.send(JSON.stringify(data));
});

var rgbRed = document.getElementById("rgbR"),
	rgbGreen = document.getElementById("rgbG"),
	rgbBlue = document.getElementById("rgbB"),
	rgbRanRed = document.getElementById("rgbRanR"),
	rgbRanGreen = document.getElementById("rgbRanG"),
	rgbRanBlue = document.getElementById("rgbRanB"),
	rgbColor = document.getElementById("rgbCol"),
	rgbReturn = document.getElementById("rgbRet");

rgbRanRed.addEventListener('input', function() {
	var value = convertBit(this.value, 255);
	console.log(this.value);
	convert(this.value, function(val) {
		rgbRed.innerHTML = val;
		colInput();
		sendRGB(1, value);
	});
});

rgbRanGreen.addEventListener('input', function() {
	var value = convertBit(this.value, 255);
	convert(this.value, function(val) {
		rgbGreen.innerHTML = val;
		colInput();
		sendRGB(2, value);
	});
});

rgbRanBlue.addEventListener('input', function() {
	var value = convertBit(this.value, 255);
	convert(this.value, function(val) {
		rgbBlue.innerHTML = val;
		colInput();
		sendRGB(3, value);
	});
});

var convert = function(val, done) {
	var v = parseInt(val);
	var value = v.toString(16);
	if (v < 16)
		value = "0" + value;
	done(value);
}

var colInput = function() {
	var red = rgbRed.innerHTML;
	var green = rgbGreen.innerHTML;
	var blue = rgbBlue.innerHTML;

	var color = "#" + red + green + blue;
	// rgbReturn.innerHTML = color;
	rgbColor.value = color;
}

var sendRGB = function(col, val) {
	var value = col + ":" + val;
	var data = {
		led: "rgb",
		value: value
	};
	// console.log(JSON.stringify(data));
	conn.send(JSON.stringify(data));
}

var convertBit = function(value, divider) {
	return parseInt((parseInt(value) * 1023) / divider);
}
