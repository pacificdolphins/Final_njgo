<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/common/reset.css">
<c:import url="./tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="./resources/css/common/basic.css">
</head>
<body>
	<c:import url="./tmp/header.jsp"/>
	
	<section class="main_section">
	<!-- 냉장고 재료 검색파트 -->
		<!-- Hashtag를 기반으로 검색하며, 서브쿼리 이용 예정 -->
	<!-- 날씨추천 파트 -->
		<!-- 사용자의 태그를 우선으로 정렬예정 -->
	<!-- 인기(HIT순) 정렬 파트 -->
		<!-- listInfo에 3개를 넣어서 보여주기 -->
	</section>
	<c:import url="./tmp/footer.jsp"/>
</body>
<script>
function recipe(){
	$.ajax({
		url:"./recipe/recipeList",
		type:"GET",
		success:function(data){
			$('.main_section').html(data.trim());
		}
	});
}
function search(find){
    if(event.keyCode == 13){
    	$.ajax({
    		url:"./recipe/search",
    		type:"GET",
    		data:{
    			find:find.value
    		},
    		success:function(data){
    			$('.main_section').html(data.trim());
    		}
    	});
	}
}
</script>
</html>