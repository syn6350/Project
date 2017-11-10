<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>분실 관리</title>

<style>
	.apply_butt{
		margin:0px;
		width:100%;
		background-color: #ffffff;
		border:1px solid #dddddd;
		color:#333333;
	}
	
	.apply_butt:hover{
		background-color: #e6e6e6;
		border:1px solid #adadad;
	}
	
	.apply_active{
		background-color: #a5c7fe;
		/* color:#ffffff; */
	}
</style>

<div id="content" class="col-md-10 nav_and_content">
	<div id="title">
		<span class="glyphicon glyphicon-erase"></span>&nbsp;분실 관리
	</div>
	
	<div class="jumbotron" style="background-color: #3367D6; 
	padding-bottom:5px; padding-top: 5px;">
		
		<form id="search_form" role="form">
		<div class="form-group row">	
			<div class="col-md-2">
		        <label for="employee_num" style="color:#ffffff;font-weight:bold;">사원번호</label>
		        <input class="form-control" id="employee_num" name="employee_num" type="text" placeholder="ex) 16011018" value="${vo.employee_num}">
     		 </div>     		 
			
			
			<div class="col-md-2">
				<label for="department" style="color:#ffffff;font-weight:bold;">부서명</label>
				  <select class="form-control" name="department" >
					  <option value="선택" <c:out value="${vo.department==null?'selected':'' }"/>>선택</option>
					  <option value="인사" <c:out value="${vo.department eq '인사'?'selected':''}"/>>인사</option>
					  <option value="기술"<c:out value="${vo.department eq '기술'?'selected':''}"/>>기술</option>
					  <option value="생산"<c:out value="${vo.department eq '생산'?'selected':''}"/>>생산</option>
					  <option value="총무"<c:out value="${vo.department eq '총무'?'selected':''}"/>>총무</option>
				   </select>
			  </div>
			  
			  <div class="col-md-2">
				<label for="rank" style="color:#ffffff;font-weight:bold;">직책</label>
				  <select class="form-control" name="rank">
					  <option value="선택" <c:out value="${vo.rank==null?'selected':'' }"/>>선택</option>
					  <option value="사원" <c:out value="${vo.rank eq '사원'?'selected':'' }"/>>사원</option>
					  <option value="주임" <c:out value="${vo.rank eq '주임'?'selected':'' }"/>>주임</option>
					  <option value="대리" <c:out value="${vo.rank eq '대리'?'selected':'' }"/>>대리</option>
					  <option value="과장" <c:out value="${vo.rank eq '과장'?'selected':'' }"/>>과장</option>
					  <option value="차장" <c:out value="${vo.rank eq '차장'?'selected':'' }"/>>차장</option>
					  <option value="부장" <c:out value="${vo.rank eq '부장'?'selected':'' }"/>>부장</option>
				   </select>
			  </div>
					  
			 <div class="col-md-2">
				<label for="phone" style="color:#ffffff;">번호</label>
				<input type="text" class="form-control" id ="phone" name="phone" placeholder="ex) 01000000000" value="${vo.phone}">
			</div>	
			<div class="col-md-2">
				<label for="name" style="color:#ffffff;">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="ex) 홍길동" value="${vo.name}">
			</div>
						
			<div class="col-md-2">
				<br>
				<button id="search_button" type="submit" class="btn btn-default btn-lg" style=" margin-top:-7px; color:#3367D6;"><span class="glyphicon glyphicon-search"></span> 검색</button>
			</div>
		</div><!-- 그룹 -->
		</form>

	</div><!-- jumbotron search -->
		
	
		
	<!-- 테이블 -->
	<table class="table table-striped table-bordered">
			<thead><!-- 리스트목록 -->
		      <tr >
		        <th>사 번</th>
		        <th>부 서 명</th>
		        <th>직 책</th>
		        <th>번 호</th>
		        <th>이 름</th>   
		      </tr>
		    </thead>
		    
		    
			<tbody><!-- 리스트 상세명단 -->
		      
		      <c:forEach items="${list}" var="list">
		      	
		      		<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.employee_num}
		      		<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.department}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.rank}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.phone}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.name}
								
		      	
		      	<tr class="controll_view" id="${list.employee_num}_controll_view" style="display: none;">
		      		<td colspan="6">
		      			내용
		      		</td>
		      	</tr>
		      	
		      </c:forEach>
		      
		    </tbody>
	
		</table>
	</div><!-- container -->

<script>
var padding_height;

function view_controll(e_num)
{
	
	if($("#"+e_num+"_controll_view").css("display") == "none")
	{
		$("#"+e_num+"_controll_view").show("fest");
		padding_height = $("#content").height()+30 - $('.nav_div').height();
		$('.nav_div').css('min-height', $("#content").height()+30);
	}
	else
	{
		$("#"+e_num+"_controll_view").hide("fest");
		$('.nav_div').css('min-height', $("#content").height()+30 - padding_height );
	}
}

$(document).ready(function(){
	var formObj=$("form[role='form']");
	$("#search_button").on("click",function(){//검색 활성화	
		formObj.attr("action","lf_list_search");
		formObj.attr("method","get");
		formObj.submit();
	});
	
});//ready


</script>

