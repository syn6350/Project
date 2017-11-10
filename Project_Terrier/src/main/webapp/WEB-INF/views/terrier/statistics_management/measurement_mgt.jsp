<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.down_butt{
	margin-left:5px;
	background-color: #ffffff;
	border:1px solid #dddddd;
	color:#333333;
}
.down_butt:hover {
	background-color: #e6e6e6;
	border:1px solid #adadad;
} 

</style>

<div id="content" class="col-md-10 nav_and_content">
	<div id="title">
		<span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;날짜별 사용률 통계관리
	</div>
	<div class="container-fluid" style="margin-top:20px; margin-bottom:20px;"><!-- 컨테니어 커스텀설정 -->
	
	
	
	<!-- 첫번째줄시작 -->
	<div class="row">
		<div class="col-md-12" style="padding-left: 0px;margin-right: 4px;"> 
			<div class="panel panel-primary">
				<div class="panel-heading" style="background-color: #3367d6;">
					날짜별 ON/OFF 통계
					<a class="btn icon-btn btn-muted down_butt" href="javascript:pdfdown()">PDF 다운로드</a>
				</div>
				
				<div class="panel-body" style="padding: 0px; margin-bottom: 5px;">
					<!--판넬몸통 -->
					<div class="col-md-8" id="pdf_div">					
						<div id=chart_div style="width: 100%; height: 250px;">
						</div>
					</div>
					
					<div class="col-md-3">
						<div id="date_ch">
						<label>날짜 선택 : </label> 
							<input id="date" type="date" value="${now}"style="height:25px;margin-top: 20px; margin-left: 5px">
							&nbsp;<button id="serach" class="btn btn-primary">검색</button>						
							<input type='hidden' id="dateHidden" value="${now}"> <!-- 숨겨진 시간정보 -->			
						</div>
					</div>
							
				</div>				
			</div>
		</div>
	</div>
		<!-- row1번재줄끝------------------------------------------------ -->
		<div class="row">
		<div class="col-md-12" style="padding-left: 0px; margin-right: 0px;"> 
			<div class="panel panel-primary">
				<div class="panel-heading" style="background-color: #3367d6;">
					날짜,부서별 ON/OFF 통계
				</div>
				
				<div class="panel-body" style="padding:0px;margin-bottom: 5px;">
					<!--판넬몸통 -->
				<div class="col-md-8">
					<div id=chart_div1 style="width: 100%; height: 250px;">
					</div>
				</div>				
				<div class="col-md-3">
					<div id="date_ch1">
							<label>날짜 선택 : </label> 
							<input id="date1" type="date" value="${now}" style="height:25px;margin-top: 20px; margin-left: 5px;">				
							<div class="row">
								<label style="height:25px;margin-top:5px;margin-bottom:5px;margin-left: 15px;" >부서 선택 : </label>
									<select id="dep1" style="width: 150px;margin-left: 5px;">
										<option value="선택">선택</option>
										<option value="인사">인사부</option>
										<option value="기술">기술부</option>
										<option value="생산">생산부</option>
										<option value="총무">총무부</option>
									</select>
									&nbsp;<button id="serach1" class="btn btn-primary">검색</button>
							</div>
							<input type='hidden' id="dateHidden1" value="${now}"> <!-- 숨겨진 시간정보 -->				
					</div>
				</div>						
				</div>
			</div>
		</div>
		</div>
		<!-- row2번재줄끝------------------------------------------------ -->
		
	
	<div class="row">
		<div class="col-md-9" style="padding-left: 0px;margin-right: 4px;"> 
			<div class="panel panel-primary">
				<div class="panel-heading" style="background-color: #3367d6;">
					날짜,부서별 ON 통계
				</div>
				
				<div class="panel-body" style="padding: 0px;margin-bottom: 5px;">
					<!--판넬몸통 -->
					<div class="col-md-5">
						<div id=chart_div2>
						</div>
					</div>
					<div class="col-md-4">
		 				<div id="date_ch2">
							<label>날짜 선택 : </label> 
							<input id="date2" type="date" value="${now}" style="height:25px;margin-top: 20px;">
							<div class="row">
								<label style="height:25px;margin-top:5px;margin-bottom:5px;margin-left: 15px;" >부서 선택 : </label>
									<select id="dep2" style="width: 150px;margin-left: 0px;">
										<option value="선택">선택</option>
										<option value="인사">인사부</option>
										<option value="기술">기술부</option>
										<option value="생산">생산부</option>
										<option value="총무">총무부</option>
									</select>
									<div class="row">
										<button id="serach2" class="btn btn-primary" style="margin-left:100px;">검색</button>
									</div>
									<input type='hidden' id="dateHidden2" value="${now}"> <!-- 숨겨진 시간정보 -->	
							</div>
						</div>
					</div>
						
				</div>
				
			</div>
		</div>
		
		<div class="col-md-9" style="padding-left: 0px; margin-right: 0px;"> 
			<div class="panel panel-primary">
				<div class="panel-heading" style="background-color: #3367d6;">
					날짜,사원별 ON 통계
				</div>
				
				<div class="panel-body" style="padding:0px;margin-bottom: 5px;">
					<!--판넬몸통 -->
					<div class="col-md-5">
						<div id=chart_div3>Chart_div3</div>
					</div>
					<div class="col-md-4">
						<div id="date_ch3">
								<label>날짜 선택 : </label> 
								<input id="date3" type="date" value="${now}" style="height:25px;margin-top: 20px;">
								<div class="row">
									<label style="height:25px;margin-top:5px;margin-bottom:5px;margin-left: 15px;" >사원번호 입력 : </label>									
									<input type="text" id="emp" style="width: 120px;margin-left: 0px;height: 25px;">
									<div class="row">
										<button id="serach3" class="btn btn-primary" style="margin-left: 100px;">검색</button>
									</div>
								</div>
						</div>
					</div>	
					
				</div>
			</div>
		</div>
	</div>
	</div><!-- <container-fluid"> -->	
</div><!-- <content> -->


<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart1);
google.charts.setOnLoadCallback(drawChart2);
google.charts.setOnLoadCallback(drawChart3);


/* chart_div구간---------------------------------------------------------------------------------*/
/* drawChart->drawChart_serach */
function drawChart(arrData) {
	var date=$("#date").val();
	$("#dateHidden").val(date); /* PDF다운로드 날짜주기용 */
	  if(arrData==null)
	  {
		var data = google.visualization.arrayToDataTable([
          ['전체사원 제어 현황', 'ON', 'OFF'],
          ['Wifi', ${ON.wifi}, ${OFF.wifi}],
          ['Bluetooth', ${ON.bluetooth},${OFF.bluetooth}],
          ['Tethering', ${ON.tethering},${OFF.tethering}],
          ['Camera', ${ON.camera},${OFF.camera}],
          ['VoiceRecord',${ON.voiceRecord},${OFF.voiceRecord}]
        ]);
	  }
	  
	  else
	  {
		var data = google.visualization.arrayToDataTable(arrData);
	  }
	
		 var options = {
				 width: 850,
		         series: {
		           0: {targetAxisIndex: 0},
		         },
		         title: date+'_ON/OFF Data'
		       };
     		 var chart = new google.visualization.ColumnChart(chart_div); 
        	chart.draw(data,options);
  }



/*여기서부터는 날짜를 선택했을때 움직이는 차트*/

$("#serach").on('click',function(){
	var date=$("#date").val();
	var on="ON";
	var off="OFF";
	var Obj_on;
	var Obj_off;
	
	$.ajax({
		type:"POST",
		url:"dateSerach_on_off",
		async:false,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		data:JSON.stringify({date:date,controller:on}),
		success:function(data)
		{
			Obj_on=data;
		}
	});/*ON을 위한 ajaxt*/
	
	$.ajax({
		type:"POST",
		url:"dateSerach_on_off",
		async:false,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		data:JSON.stringify({date:date,controller:off}),
		success:function(data)
		{
			Obj_off=data;
		}
	});/*OFF를 위한 ajaxt*/
	
	var arrData=[
        ['전체사원 제어 현황', 'ON', 'OFF'],
        ['Wifi', Obj_on.wifi, Obj_off.wifi],
        ['Bluetooth', Obj_on.bluetooth,Obj_off.bluetooth],
        ['Tethering', Obj_on.tethering,Obj_off.tethering],
        ['Camera', Obj_on.camera,Obj_off.camera],
        ['VoiceRecord',Obj_on.voiceRecord,Obj_off.voiceRecord]
      ]
		drawChart(arrData);	
}); /* "#serach" */
/* chart_div구간 끝---------------------------------------------------------------------------------*/


/* chart_div1구간--------------------------------------------------------------------------------*/
function drawChart1(arrData) {
	var date=$("#date1").val();
	$("#dateHidden1").val(date); /* PDF다운로드 날짜주기용 */
	  if(arrData==null)
	  {
		var data = google.visualization.arrayToDataTable([
          ['부서별 제어 현황', 'ON', 'OFF'],
          ['Wifi', 0,0],
          ['Bluetooth',0,0],
          ['Tethering',0,0],
          ['Camera', 0,0],
          ['VoiceRecord',0,0]
        ]);
	  }
	  
	  else
	  {
		var data = google.visualization.arrayToDataTable(arrData);
	  }
	
		 var options = {
				 width: 850,
		         series: {
		           0: {targetAxisIndex: 0},
		         },
		         title: date+'_ON/OFF Data'
		       };
     		 var chart = new google.visualization.ColumnChart(chart_div1); 
        	chart.draw(data,options);
  }


 
$("#serach1").on('click',function(){
	var dep=$("#dep1 option:selected").val();
	var date=$("#date1").val();
	var on="ON";
	var off="OFF";
	var Obj_on;
	var Obj_off;
	
	if(dep=="선택")
		{
			alert("부서를 선택해주세요");
		}
	else
		{
			$.ajax({
				type:"POST",
				url:"dep_dateSerach_on_off",
				async:false,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"},
				data:JSON.stringify({date:date,controller:on,dep:dep}),
				success:function(data)
				{
					Obj_on=data;
				}
			});/*ON을 위한 ajaxt*/
			
			$.ajax({
				type:"POST",
				url:"dep_dateSerach_on_off",
				async:false,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"},
				data:JSON.stringify({date:date,controller:off,dep:dep}),
				success:function(data)
				{
					Obj_off=data;
				}
			});/*OFF를 위한 ajaxt*/
			
			var arrData=[
		        ['전체사원 제어 현황', 'ON', 'OFF'],
		        ['Wifi', Obj_on.wifi, Obj_off.wifi],
		        ['Bluetooth', Obj_on.bluetooth,Obj_off.bluetooth],
		        ['Tethering', Obj_on.tethering,Obj_off.tethering],
		        ['Camera', Obj_on.camera,Obj_off.camera],
		        ['VoiceRecord',Obj_on.voiceRecord,Obj_off.voiceRecord]
		      ]
				drawChart1(arrData);				
		}/* else */	
}); /* "#serach" */ 
/* chart_div1구간 끝---------------------------------------------------------------------------------*/

/* chart_div2구간--------------------------------------------------------------------------------*/
function drawChart2(arrData) {
        // Create the data table.
        var date=$("#date2").val();
        $("#dateHidden2").val(date);  /*PDF다운로드 날짜주기용 */
        var data = new google.visualization.DataTable();
        data.addColumn('string', '부서');
        data.addColumn('number', '제어');
  		$.each(arrData,function(i,Data){
  			alert
  		});

  	  if(arrData==null)
		  {
	          data.addRows([
	              ['NoData', 1],
	              ['NoData', 1],
	              ['NoData', 1],
	              ['NoData', 1],
	              ['NoData', 1]
	            ]);
		  }
  	  else
  		  {
  			data.addRows(arrData);
  		  }
        // Set chart options
        var options = {'title':'부서 통계관리',
                       'width':450,
                       'height':250};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
        
      }
$("#serach2").on('click',function(){ //on에대한 정보만 입력값 날짜,부서
	var date=$("#date2").val();
	var dep=$("#dep2 option:selected").val();
	var on="ON";
	var Obj_on;
	
	if(dep=="선택")
	{
		alert("부서를 선택해주세요");
	}
	else{
		$.ajax({
			type:"POST",
			url:"fi_dep_dateSerach_on",
			async:false,
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"},
			data:JSON.stringify({date:date,controller:on,dep:dep}),
			success:function(data)
			{
				Obj_on=data;
			}
		});/*ON을 위한 ajaxt*/
	
		var arrData=[
	        ['Wifi', Obj_on.wifi],
	        ['Bluetooth',Obj_on.bluetooth],
	        ['Tethering', Obj_on.tethering],
	        ['Camera',  Obj_on.camera],
	        ['VoiceRecord',Obj_on.voiceRecord]
		]
		drawChart2(arrData);
	}
});
/* chart_div2구간 끝---------------------------------------------------------------------------------*/

/* chart_div3구간--------------------------------------------------------------------------------*/
function drawChart3(arrData) {
        // Create the data table.
        var date=$("#date3").val();
        /*$("#dateHidden").val(date);  PDF다운로드 날짜주기용 */
        var data = new google.visualization.DataTable();
        data.addColumn('string', '토핑');
        data.addColumn('number', '시리얼');
        data.addRows([
          ['Mushrooms', 2],
          ['Onions', 2],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 4]
        ]);

        // Set chart options
        var options = {'title':'사용자 통계관리',
                       'width':450,
                       'height':250};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart.draw(data, options);
        
      }

/* chart_div3구간 끝---------------------------------------------------------------------------------*/




/* pdf다운로드 구간---------------------------------------------------------------------- */
function pdfdown(){
	var dateok=$("#dateHidden").val();
	
	html2canvas(document.getElementById('pdf_div'),{
        onrendered: function(canvas) {
         	var imgData = canvas.toDataURL('image/png',1);
        	var doc=new jsPDF('p','mm',"a4");
        	doc.addImage(imgData,'PNG',8,8,195,95);
        	/* doc.setTextColor(0,255,0); */
        	doc.setFontSize(15);
        	doc.text(30, 100,dateok+'Date controller statistics');
    		doc.save(dateok+'DateController_On/off.pdf');
		}
	 });
}


</script>
