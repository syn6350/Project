<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/webjars/jquery/2.1.3/dist/jquery.min.js"></script>
    
<div id=chart_div4 style="width: 100%; height: 300px;">

</div>
    
    
<script>
	//Load the Visualization API and the corechart package.	
	google.charts.load('current', {'packages':['corechart']});/* 일반적인 차트로드 */     
	google.charts.load('current', {'packages':['bar']}); /* 듀얼이나 트리플은 해당 차트를 로드해야함 */
	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart4);
	
	function drawChart4() {
		var dep="${department}";		
		if(dep=="undefined")
		{
			dep="선택된 부서가없습니다";
		}
		else
		{
			dep = "${department}" + "부";	
		}
		
		var data = google.visualization.arrayToDataTable([
	            [dep+' 제어 현황', 'ON', 'OFF'],
	            ['Wifi', ${d_count_on.wifi}, ${d_count_off.wifi}],
	            ['Bluetooth', ${d_count_on.bluetooth}, ${d_count_off.bluetooth}],
	            ['Tethering', ${d_count_on.tethering}, ${d_count_off.tethering}],
	            ['Camera', ${d_count_on.camera}, ${d_count_off.camera}],
	            ['VoiceRecord', ${d_count_on.voiceRecord}, ${d_count_off.voiceRecord}]
	          ]);

/* 	          var options = {
		              animation:{
		      			startup: true,
		      			duration: 1000,
		      			easing: 'out'
		      		  }
	          }; */
	 		 var options = {
	 		         width: 620,
	 		         series: {
	  		           0: {targetAxisIndex: 0},
	 		         },
	 		         title: dep
	 		       };

	          var chart = new google.visualization.ColumnChart(chart_div4); 
	          chart.draw(data,options);


	}
</script>

