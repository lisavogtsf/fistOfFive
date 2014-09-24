$(document).ready(function() {

  var myChart;

    $.post('/search.json', {search: searchParams})
      .done(function(data) {
      console.log(data);

      // testing hack
      data = ["5", "6", "7"];

      if (data.length === 0) {

        $("#myChart").hide();
        $('.no-data').fadeIn('slow');
      }

      else {
      	console.log("chart recognized data exists,", data);
        // // CHART.JS LOGIC
        // var chartDatasets = []; //to be filled in with an object for each data

        // // iterate through data
        // for(var i = 0; i<data.length; i+=1){
        //   // console.log("data "+i+" was created at " + data[i].hour_created+" and the surge multiplier was "+ data[i].surge_multiplier);

        //   var chartDataArray = []; //to be populated at [j] with "null" until j == data[i].hour_created where the value will be data[i].surge_multiplier
        //   // iterate through chartDataArray to populate it
        //   for (var j = 0; j <= data[i].hour_created; j+=1){
        //    if(j < data[i].hour_created){
        //      chartDataArray[j] = null;
        //    } else {
        //     chartDataArray[j] = data[i].surge_multiplier;
        //    }
        //   }
        //   console.log(data[i].display_name);

        chartDataArray = data;

          // add data[i] chart object to chartDatasets
          var standardColor = "#72c9b3";

          var dataChartObject = {
            //the pre-set key values to get rid of lines/fill colors nad to set point colors etc
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0)",
            strokeColor: "rgba(220,220,220,0)",
            pointColor: standardColor ,
            pointStrokeColor: standardColor ,
            pointHighlightFill: standardColor ,
            pointHighlightStroke: "rgba(220,220,220,1)",
            // the data point to be plotted
            data: chartDataArray
          };

         
        var chartLabels = ["0", "1", "2", "3", "4", "5"]; //the X-axis of the chart

        //the chartData to be passed to our chart
        var chartData = {
            labels: chartLabels,
            datasets: dataChartObject //populated above by iterating through data
        };

        //options that we want to change from default values, see http://www.chartjs.org/docs/#getting-started-global-chart-configuration
        //and http://www.chartjs.org/docs/#line-chart-chart-options
        var options = {

          ///Boolean - Whether grid lines are shown across the chart
          scaleShowGridLines : false,

          // //String - Colour of the grid lines
          // scaleGridLineColor : "rgba(0,0,0,.05)",

          // String - Colour of the scale line
          scaleLineColor: "white",

          // String - Scale label font colour
          scaleFontColor: "white",

          //Number - Width of the grid lines
          scaleGridLineWidth : 1,

          //Boolean - Whether the line is curved between points
          bezierCurve : true,

          //Number - Tension of the bezier curve between points
          bezierCurveTension : 0.4,

          //Boolean - Whether to show a dot for each point
          pointDot : true,

          //Number - Radius of each point dot in pixels
          pointDotRadius : 6,

          //Number - Pixel width of point dot stroke
          pointDotStrokeWidth : 1,

          //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
          pointHitDetectionRadius : 20,

          //Boolean - Whether to show a stroke for datasets
          datasetStroke : true,

          //Number - Pixel width of dataset stroke
          datasetStrokeWidth : 2,

          //Boolean - Whether to fill the dataset with a colour
          datasetFill : true,

          //String - A legend template
          legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

        };

        var ctx = document.getElementById("myChart").getContext("2d"); //get our canvas from views/site/index.html.erb line 45
        if (myBarGraph){
          myBarGraph.destroy();
        }
        $("#myChart").css('backgroundColor', 'rgba(0, 0, 0, .75)');
        $("#myChart").fadeIn('slow');
        //CREATE THE CHART
        var myBarChart = new Chart(ctx).Bar(data, options);
      }

    } //close .done(function(data) on line 22
  );
}); //close $(document).ready(function() on line 1