window.chartColors = {
    red: 'rgba(255, 99, 132,0.5)',
    orange: 'rgba(255, 159, 64,0.5)',
    yellow: 'rgba(255, 205, 86,0.5)',
    green: 'rgba(75, 192, 192,0.5)',
    blue: 'rgba(54, 162, 235,0.5)',
    purple: 'rgba(153, 102, 255,0.5)',
    grey: 'rgba(231,233,237,0.5)'
};

window.chartColorsAry = [
    chartColors.red,
    chartColors.orange,
    chartColors.yellow,
    chartColors.green,
    chartColors.blue,
    chartColors.purple,
    chartColors.grey
];


window.GetColors = function (number) {
    var ary = new Array();
    for (var i = 0; i < number; i++) {
        ary.push(window.chartColorsAry[i]);
    }
    return ary;
};
window.GetRandomColors = function (number) {
    var ary = new Array();
    for (var i = 0; i < number; i++) {
        ary.push(window.chartColorsAry[Math.round(Math.random() * 7) + 1]);
    }
    return ary;
};
