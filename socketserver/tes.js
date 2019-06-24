var obj = false;
console.log(obj);
obj = {
    a: [{
        nama: "samuel",
        umur: 20
    }, {
        nama: "bonet",
        umur: 21
    }],
    b: [{
        sekolah: "smp",
        jalan: "s parman"
    }, {
        sekolah: "sma",
        jalan: "panjaitan"
    }]
}
console.log(obj);
// console.log('Size of object: ' + Object.keys(obj).length)
// for (var key in obj) {
//     if (obj[key] === obj.b) {
//         console.log(key);
//     }
//     // if (obj.hasOwnProperty(key)) {
//     //     console.log(key + " -> " + obj[key]);
//     // }
// }