$(document).ready(function() {
	var myChart;

	var searchParams = 0;//??

	$.post('/chart.json', {search:
		searchParams})
	.done(function(data){
		console.log(data);

	});
});