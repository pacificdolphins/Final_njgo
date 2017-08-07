<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="message_container">
		
		<div class="form-group" style="padding: 30px;">
			<label class="control-label" style="padding: 0px;margin-top:5px;float: left; width: 60px;" >제목:</label>
    		  <div class="col-xs-10">
    		  	<!-- 제목 -->  
    		    <input type="text" class="form-control col-xs-2" name="title" id="title" style="background-color:white;  width: 100%;" value="${messageDTO.title }" readonly="readonly">
    		  </div>
    		  <br><br><br>
			 <label class="control-label " style="padding: 0px;margin-top:5px;float: left;"  >보낸사람:</label>
    		  <div class="col-xs-10">     
    		  	<!-- 보낸사람 -->     
    		    <input  type="text" class="form-control col-xs-2" name="get_nickName" id="get_nickName" style="background-color:white; width: 100%;" value="${messageDTO.send_nickName }"  readonly="readonly" >
    		  </div>
			<br><br><br>
	  		<textarea style="background-color: white;" class="form-control" name="contents" id="contents" rows="8" id="comment" readonly="readonly">${messageDTO.contents }</textarea>
	  		<input type="hidden" id="category" value="${category }">
	  		<c:if test="${category ne 'send' }">
	  			<button class="btn btn-success" onclick="messageReply('${messageDTO.send_nickName }')"  style="margin-top: 10px;margin-bottom:10px; float: right;width: 120px;"> 답변 </button>
	  		</c:if>
		</div>
	
	</div>
</body>
</html>