<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id=inputarea>
	<input type="text" name="contents" id="reply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=reply_btn class="btn btn-warning" value="등록">
</div>
<hr>
<c:forEach items="${list}" var="rdto">
	<div class="reply_list" id="${rdto.num}">
		<c:if test="${rdto.depth>0 }">
		<c:forEach begin="1" end="${rdto.depth }" step="1">
			&nbsp;&nbsp;
		</c:forEach>
		</c:if>
		<%-- <c:if test='${rdto.writer eq member.nickname}'> --%>
		<span class="rmod" title="${rdto.num}">수정</span>
		<span class="rdel" title="${rdto.num}">삭제</span>
		<%-- </c:if> --%>
		<span class="r_reply" title="${rdto.num}">답글</span>
		<span class="r_id">${rdto.writer}</span><span class="r_date">${rdto.time}</span>
		<br>
		<c:if test="${rdto.depth>0 }">
		<c:forEach begin="1" end="${rdto.depth }" step="1">
			<img src="../resources/images/kdk/reply_icon.png">
		</c:forEach>
		</c:if>
			<div class="r_con" style="display:inline">${rdto.contents}</div>
		<p id=replyinput style="display:none"><input type="text" name="contents" id="replyReply_contents">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=replyReply_btn class="btn btn-warning" value="등록"></p>
	</div>
</c:forEach>
<script>
	$('#reply_btn').click(function(){
		var repcont=$('#reply_contents').val();
		if(repcont!=''){
			$.ajax({
				url:'replyWrite',
				method:"POST",
				data:{
					recipenum:$('#recipenum').val(),
					/* writer:session의 닉네임 */
					contents:repcont
				},
				success:function(data){
					location.reload();
				}
			});	
		}else{
			alert('내용이 필요합니다!');
		}
	});
	$(".reply_list").on("click",".rdel",function(){
		var num=$(this).attr("title");
		var rnum=$('#recipenum').val();
		if(confirm('정말로 삭제하시겠습니까?')){
			$.get("../recipe/replyDelete?num="+num+"&rnum="+rnum,function(data){
				location.reload();
			});
		}
	});
	$(".reply_list").on("click",".rmod",function(){
    	var num = $(this).attr("title");
    	var rnum=$('#recipenum').val();
    	$(".reply_list").load("../recipe/replyUpdate?num="+num+"&recipenum="+rnum);
     });
	
	$(".reply_list").on("click", ".r_reply", function(){
		var num = $(this).attr("title");
    	var rnum=$('#recipenum').val();
    	$('#replyinput').css('display', 'block');
    	$("#replyReply_btn").click(function(){
    		var modcon = $("#replyReply_contents").val();
    		$.get("replyReply", {num:num, recipenum:rnum, contents:modcon}, function(data){
    			location.reload();
    		});
     	}); 
	});
</script>