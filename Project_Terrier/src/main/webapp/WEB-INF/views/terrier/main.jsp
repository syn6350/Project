<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<title>asde</title>

<script>
var result='${msg}';
if(result=='SUCCESS')
	{
		alert("로그인성공");
	}
 $(document).ready(function(){
	$("#out").on("click",function(evt){
		self.location="/terrier/logout";
	});
	
});//ready

</script>
