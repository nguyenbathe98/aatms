$(document).on('ready turbolinks:change turbolinks:load', function () {
  var data_chart = $('#dn-chart-report').data('chart');
    $('#dn-chart-report').highcharts({
      chart: {
        type: 'column'
      },
      title: {
        text: 'Chart Score'
      },
      xAxis: {
        type: 'category'
      },
      yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
            text: 'Number of Student'
        }
      },
      legend: {
          enabled: false
      },
      credits: {
        enabled: false
      },
      tooltip: {
          pointFormat: '<b>{point.y:.1f} Scores</b>'
      },
      series: [{
        data: data_chart ,
        pointWidth: 40,
        dataLabels: {
          enabled: true,
          color: '#FFFFFF',
          align: 'center',
          format: '{point.y:.1f}',

          y: 5,
          style: {
              fontSize: '16px',
              fontFamily: 'Verdana, sans-serif'
          }
        }
      }]
    });
});
