<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<link rel="stylesheet" media="all" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample_haemeog.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../../tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/kdy/member/memberCheck.js"></script>
<!-- 카카오톡 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 해먹남겨 css -->
<script type="text/javascript">
	if("${memberDTO}"==""){
		alert("로그인 해주세요.");
		location.href="../login";
	}
</script>
 
</head>  
<body>
	<c:import url="../../tmp/header.jsp" />

	<section class="main_section">
		<div id="container">



			<div id="dialog-message" title="알림"
				class="haemuk-dialog-with-jquery-ui"></div>
			<!-- TODO 페이지별로 다른 리소스를 사용하는 경우 처리 -->
			<link rel="stylesheet" type="text/css"
				href="http://d1hk7gw6lgygff.cloudfront.net/assets/_css/mypage-0485c54c43e2bfff2e6096a8445ef9fc.css?1501056816">

			<div id="content">
				<section class="sec_mypage">
					
					<!-- [D] 상단 사용자정보 영역 -->
					<div class="user_information">
						<div class="inner">
							<img alt="" id="myPhoto" >
							<strong>${myPage.nickName }</strong>
							<!-- [D] 베스트유저인 경우	<strong class="best">김문어씨</strong>-->
						<span class="follow"><em>0명 </em>팔로잉</span>

							<p class="link">
								<a target="_blank" href="http://"></a>
							</p>
							<p class="dsc">${myPage.info }</p>

							<div class="btn_area">
								<!-- [D] 내 콜렉션인 경우 -->
								<c:if test="${myPage.nickName eq memberDTO.nickName }">
									<button id="profile_btn" class="btn_config call_profile">프로필설정&gt;</button>
								</c:if>
								<c:if test="${myPage.nickName != memberDTO.nickName }">
									<button  class="btn_config call_profile">팔로우&gt;</button>
								</c:if>
						<!-- =============================The Modal ===============================-->
								<div id="vProfileImageModal" class="modal in" role="dialog" aria-hidden="false" style="display: none; padding-right: 17px;">
							      <div class="modal-dialog" style="width:570px">
							        <div class="modal-content" style="padding:0;">
							          <div class="modal-header">
							            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/images/common/btn_close.gif" alt="닫기"></span></button>
							            <h4 class="modal-title">프로필 사진 / 자기소개 편집</h4>
							          </div>
							          <div class="modal-body" style="padding:10px;text-align:center;">
							                      <img id="profile_img" src="" style="max-width:550px;max-height:500px;">
							            <div style="margin-top:10px;">
							            <!-- form  -->
							            <form action="profile_upload" method="post" enctype="multipart/form-data">
								            <input type="file" name="myPhoto" id="file_1" style="display:none;" onchange="profileLoad(this)">
								            <input type="hidden" name="email" value="${myPage.email }">
											<p><input type="text" name="info" value="" id="info" class="input-sm" size="60" maxlength="100" placeholder="자기소개를 100자 이내로 작성해 주세요."></p>
							            </form>
							            <button type="button" onclick="document.getElementById('file_1').click();" class="btn btn-primary">프로필 사진 바꾸기</button>
							            <button type="button" id="profileSubmitBtn" class="btn btn-primary" disabled="disabled">저장</button>
							            </div>
							                    </div>
							        </div>
							      </div>
							    </div>
								
								
								
								
								<!-- <a href="javascript:;" class="btn_share">소개하기</a> -->
							</div>
						</div>
					</div>

					<!-- //상단 사용자정보 영역 -->

					<div class="tab_st1">
						<div class="inner">
							<!-- =============================== MyPage 기능 =============================  -->
							<c:if test="${memberDTO.grade < 2 }">
								<ul>
									<li class="on"><a href="/mypage"> <strong>마이레시피</strong><em>0</em>
									</a></li>
									<li><a href="/mypage/scraps"> <strong>스크랩</strong><em>2</em>
									</a></li>
									<li><a href="/mypage/following"> <strong>팔로잉</strong><em>1</em>
									</a></li>
										<li><a href="/mypage/following"> <strong>쪽지함</strong><em>1</em>
									</a></li>
										<li><a href="/mypage/following"> <strong>주문내역</strong><em>1</em>
									</a></li>
								</ul>	
							</c:if>
							<c:if test="${memberDTO.grade > 1 }">
								<ul>
									<li class="on"><a href="/mypage"> <strong>사용자 리스트</strong><em>0</em>
									</a></li>
									<li class="off"><a href="/mypage"> <strong>신고함 </strong><em>0</em>
									</a></li>
								</ul>
							</c:if>
							
						</div>
					</div>

					

				</section>
			</div>

		</div>
	</section>

	<c:import url="../../tmp/footer.jsp" />
</body>
<script type="text/javascript">
	$(function() {
		
		/* 마이페이지 이미지   */
		// 이미지가 없을경우 기본값
		if("${myPage.myPhoto}"==""||"${myPage.myPhoto}"==null){
			$("#myPhoto").attr("src","${pageContext.request.contextPath}/resources/images/common/default.png");
			$("#profile_img").attr("src","${pageContext.request.contextPath}/resources/images/common/default.png");
		}
		// SNS 회원 처음 가입하면 myPhoto = "sns" 값 , 즉 카카오에 설정되있는 기본 이미지 경로이므로 
		// sns 값이라면 프로필 수정하기 전 이므로 세션에 저장해놓은 kakao 이미지 경로를 src에 넣어준다.
		else if("${myPage.myPhoto}"=="sns"){
			$("#myPhoto").attr("src","${memberDTO.sns_photo}");	
			$("#profile_img").attr("src","${memberDTO.sns_photo}");	
		}
		// 세션에 저장된 member의 myPhoto 파일 이름을 가져옴
		else {
			$("#myPhoto").attr("src","${pageContext.request.contextPath}/resources/upload/${myPage.myPhoto}");
			$("#profile_img").attr("src","${pageContext.request.contextPath}/resources/upload/${myPage.myPhoto}");
		}
		
	})
	
	/* ========================================== Modal Script ===================================================  */	
	    // 프로필 사진이 수정되면 "저장버튼" 활성화
		$("#file_1").change(function(e) {
			$("#profileSubmitBtn").removeAttr("disabled");
			 	/* if (e.target.files[0].size > (2*1024*1024)) {
			        alert("사진은 2MB까지만 허용됩니다.");
			        return false;
			    }  */	 	
		 }); 
		$("#info").change(function() {
			$("#profileSubmitBtn").removeAttr("disabled");
		});
		
		$("#profileSubmitBtn").click(function() {
			$("form").submit();            
	    });
	
	// 미리보기기능 FileReader사용  
	function profileLoad(value) {
					  var inputImg = $("#file_1").val();
					  alert(inputImg);
			          var reader = new FileReader();         //파일을 읽기 위한 FileReader객체 생성
			          if(inputImg == ''){
		  		            $("#profile_img").removeAttr("src");
		  		            $("#profile_img").hide();
		  		         }
			         if(value.files && value.files[0]){
			           
			            reader.onload = function(e) {         //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			            	
			               $("#profile_img").show();
			               $("#profile_img").attr("src", e.target.result);
			            }
			            reader.readAsDataURL(value.files[0]);    //File내용을 읽어 dataURL형식의 문자열로 저장		          
			         }
			         reader.onerror = function(e){
			        	  alert("읽기 오류:" + e.target.error.code);
			        	  return;
			        	}
  			} // profileLoad
	
	$("#profile_btn").click(function() {
		$(".modal").css("display","block");
	});
	$(".close").click(function() {
		$(".modal").css("display","none");
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == "modal") {
	        modal.style.display = "none";
	    }
	}
	/* ========================================== Modal Script ===================================================  */
</script>
</html>