<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 태그별 검색 -->
	<div id=categories>
		<span style="background-color:#ffcc00">종류별</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_kind>밑반찬</span>&nbsp;&nbsp;<span class=c_kind>메인반찬</span>&nbsp;&nbsp;<span class=c_kind>국/탕</span>&nbsp;&nbsp;<span class=c_kind>찌개</span>&nbsp;&nbsp;<span class=c_kind>디저트</span>&nbsp;&nbsp;<span class=c_kind>면/만두</span>&nbsp;&nbsp;<span class=c_kind>밥/죽/떡</span>&nbsp;&nbsp;<span class=c_kind>퓨전</span>&nbsp;&nbsp;<span class=c_kind>김치/젓갈/장류</span>&nbsp;&nbsp;<span class=c_kind>양념/소스/잼</span>&nbsp;&nbsp;<span class=c_kind>양식</span>&nbsp;&nbsp;<span class=c_kind>샐러드</span>&nbsp;&nbsp;<span class=c_kind>스프</span>&nbsp;&nbsp;<span class=c_kind>빵</span>&nbsp;&nbsp;<span class=c_kind>과자</span>&nbsp;&nbsp;<span class=c_kind>차/음료/술</span>&nbsp;&nbsp;<span class=c_kind>기타</span><br>
		<span style="background-color:#ffcc00">상황별</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_situation>일상</span>&nbsp;&nbsp;<span class=c_situation>초스피드</span>&nbsp;&nbsp;<span class=c_situation>손님접대</span>&nbsp;&nbsp;<span class=c_situation>술안주</span>&nbsp;&nbsp;<span class=c_situation>다이어트</span>&nbsp;&nbsp;<span class=c_situation>도시락</span>&nbsp;&nbsp;<span class=c_situation>영양식</span>&nbsp;&nbsp;<span class=c_situation>간식</span>&nbsp;&nbsp;<span class=c_situation>야식</span>&nbsp;&nbsp;<span class=c_situation>푸드스타일링</span>&nbsp;&nbsp;<span class=c_situation>해장</span>&nbsp;&nbsp;<span class=c_situation>명절</span>&nbsp;&nbsp;<span class=c_situation>이유식</span>&nbsp;&nbsp;<span class=c_situation>기타</span><br>
		<span style="background-color:#ffcc00">재료별</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_procedure>소고기</span>&nbsp;&nbsp;<span class=c_procedure>돼지고기</span>&nbsp;&nbsp;<span class=c_procedure>육류</span>&nbsp;&nbsp;<span class=c_procedure>채소류</span>&nbsp;&nbsp;<span class=c_procedure>해물류</span>&nbsp;&nbsp;<span class=c_procedure>달걀/유제품</span>&nbsp;&nbsp;<span class=c_procedure>가공식품류</span>&nbsp;&nbsp;<span class=c_procedure>쌀</span>&nbsp;&nbsp;<span class=c_procedure>밀가루</span>&nbsp;&nbsp;<span class=c_procedure>건어물류</span>&nbsp;&nbsp;<span class=c_procedure>버섯류</span>&nbsp;&nbsp;<span class=c_procedure>과일류</span>&nbsp;&nbsp;<span class=c_procedure>콩/견과류</span>&nbsp;&nbsp;<span class=c_procedure>곡류</span>&nbsp;&nbsp;<span class=c_procedure>기타</span><br>
		<span style="background-color:#ffcc00">방법별</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=c_ingredient>볶음</span>&nbsp;&nbsp;<span class=c_ingredient>끓이기</span>&nbsp;&nbsp;<span class=c_ingredient>부침</span>&nbsp;&nbsp;<span class=c_ingredient>조림</span>&nbsp;&nbsp;<span class=c_ingredient>무침</span>&nbsp;&nbsp;<span class=c_ingredient>비빔</span>&nbsp;&nbsp;<span class=c_ingredient>찜</span>&nbsp;&nbsp;<span class=c_ingredient>절임</span>&nbsp;&nbsp;<span class=c_ingredient>튀김</span>&nbsp;&nbsp;<span class=c_ingredient>삶기</span>&nbsp;&nbsp;<span class=c_ingredient>굽기</span>&nbsp;&nbsp;<span class=c_ingredient>데치기</span>&nbsp;&nbsp;<span class=c_ingredient>회</span>&nbsp;&nbsp;<span class=c_ingredient>기타</span><br>
	</div>
		<hr>
		<!-- 레시피 리스트 3*3, 최신순/hit순 -->
	<div id=searchresult>
		<c:forEach items="${list.listPack }" var="dto">
			<div class=main_concep_channel title=${dto.num }>		
				<div class="channel_img" style='background-image:url("resources/upload/${dto.rep_pic }")'>
					<div id="overlays${dto.num }" class=overlays>
						&nbsp;
						<br>
						<br>
						<br>
						<br>
						<div id="counts${dto.num }" class=counts></div>
						<br>					
						<br>
						<br>
						<div id="creators${dto.num }" class=creators>by ${dto.writer}</div>
						<br>
					</div>
				</div>			
				<div class="channel_title">				
					<div>${dto.foodname }</div>		
				</div>
				<div class="channel_info">
					<div>${dto.title }</div><div></div>
				</div>	
				</div>
		</c:forEach>
	</div>
		<!-- TV-만개의레시피에서 두 프로그램정도 가져오기(DB에 전부 넣어야 함, 동영상 태그까지) -->
	<script>	
		$('.overlays').css("background", "none");
		$('.creators').css("visibility", "hidden");
		$('.counts').css("visibility", "hidden");
			
		$('.main_concep_channel').mouseover(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background-image", "url('resources/images/kdk/thumb_over_rev1.png')");
			$('#creators'+num).css("visibility", "visible");
			$('#counts'+num).css("visibility", "visible");
		});
		$('.main_concep_channel').mouseleave(function(){	
			var num=$(this).attr('title');
			$('#overlays'+num).css("background", "none");
			$('#creators'+num).css("visibility", "hidden");
			$('#counts'+num).css("visibility", "hidden");		
		});
		$('#categories>span').click(function(){
			$(this).attr('title', 'selected');
		});
	</script>