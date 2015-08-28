// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.turbolinks
//= require social-share-button



function alertMessage()
{
	$( ".alert-error" ).hide();
	$( ".alert-success" ).hide();
  	$( ".alert-error" ).fadeIn(500).delay( 3000 ).fadeOut( 500 );
  	$( ".alert-success" ).fadeIn(500).delay( 3000 ).fadeOut( 500 );
}
$(document).ready(function() {

  $.ajax({
    type:"GET",
    url:"orders/test",
    dataType:"json",
    data: {some_parameter: 'hello'},
    success:function(result){
      alert(result);
    }
  })

  var fontsize = 100;
  $(".tables-content").hide(0);
	$("."+"products").hide(200);

    $(".category").click(function(event) {
        $("#"+event.target.id + "-products").toggle(200);
    });

    $(".toggle-hide").click(function(event){
      $("#"+event.target.id + "-content").toggle(200);
    });

    // ACCESSIBILITY //
    $(".bigger").click(function(){
      // var fontSize = parseInt($("#container").css("font-size"));
      fontsize = parseInt(fontsize);
      fontsize = fontsize + 10 + "%";
      $("#container").css({'font-size':fontsize});
    });

    $(".smaller").click(function(){
      fontsize = parseInt(fontsize);
      fontsize = fontsize - 10 + "%";
      $("#container,#product").css({'font-size':fontsize});
    });
});

jQuery(function() {
  $.ajax({
    type:"GET",
    url:"orders/test",
    dataType:"json",
    data: {some_parameter: 'hello'},
    success:function(result)
    {
      alert(result);
    }
  })
});
/*
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Day','Sold', 'Number of orders                .'],
          ['Monday', 0,0],
          ['Tuesday', 64.13,13],
          ['Wednesday', 4.85,1],
          ['Thusday', 42.8,12],
          ['Friday', 3.5,2],
          ['Satursday', 0,0],
          ['Sunday', 0,0]
        ]);

        var options = {
          chart: {
            title: 'Sales during week',
            subtitle: '',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          height: 400,
          width: 900,
          colors: ['#1baf77','#d95f02']
        };

        var chart = new google.charts.Bar(document.getElementById('chart_div'));

        chart.draw(data, google.charts.Bar.convertOptions(options));

        var btns = document.getElementById('btn-group');

        btns.onclick = function (e) {

          if (e.target.tagName === 'BUTTON') {
            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
            chart.draw(data, google.charts.Bar.convertOptions(options));
          }
        }
      }

*/