<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="com.pap.bucketclass.entity.Role"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="com.pap.bucketclass.entity.Member"%>
<%@ page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	Set<Role> userRole = new HashSet<>();
	String memberNickname = null;
	String memberImgUri = null;

	if (principal != null && principal instanceof Member) {
		userRole = ((Member) principal).getRoles();
		memberNickname = ((Member) principal).getMemberNickname();
		memberImgUri = ((Member) principal).getMemberImg();
		System.out.println(memberImgUri);
	}
	String roleStr = null;
	Iterator<Role> itr = userRole.iterator();
	while (itr.hasNext()) {
		roleStr = itr.next().getRoleName();
	}
%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Bucket Class</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


<!-- CSS
================================================== -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/main-color.css" id="colors">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">

	<!-- Postcodify 셋팅 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" charset="UTF-8"></script>
<!--<script type="text/javascript" src="//cdn.poesis.kr/post/search.min.js" charset="UTF-8"></script>-->
<!--[if IE 6]>

<script type="text/javascript" src="http://cdn.poesis.kr/post/search.min.js"></script><![endif]-->
<link rel="stylesheet" type="text/css" href="//cdn.poesis.kr/post/search.css" media="all" />
<link rel="stylesheet" href="/css/tags.css">

<!--hashtag	-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript" src="/js/tags.js"></script>
	<script>
		$(function() {
			$("#testInput").tags({
				unique: true,
				maxTags: 5,
			});
		});
	</script>
</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<header id="header-container">

    <!-- Header -->
    <div id="header">
        <div class="container">

            <!-- Left Side Content -->
            <div class="left-side">

                <!-- Logo -->
                <div id="logo">
                    <a href="/"><img src="/img/logo.png" alt=""></a>
                </div>

                <!-- Mobile Navigation -->
                <div class="mmenu-trigger">
                    <button class="hamburger hamburger--collapse" type="button">
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
                    </button>
                </div>

            </div>
            <!-- Left Side Content / End -->

            <!-- Right Side Content / End -->
            <div class="right-side">
                <!-- Header Widget -->
                <div class="header-widget">

                    <!-- User Menu -->
                    <div class="user-menu" id="user-menu">
                        <!------------------------------------------------->
                        <!------------- user menu content ----------------->
                        <!------------------------------------------------->
                    </div>
                </div>
                <!-- Header Widget / End -->
            </div>
            <!-- Right Side Content / End -->

        </div>
    </div>
    <!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->

	<a href="#" class="dashboard-responsive-nav-trigger"><i
			class="fa fa-reorder"></i> Dashboard Navigation</a>

		<div class="dashboard-nav">
			<div class="dashboard-nav-inner">
				<ul id="sidebar">
					<!------------------------------------------------->
					<!------------- side bar content ------------------>
					<!------------------------------------------------->
				</ul>
			</div>
		</div>

		<!-- Navigation / End -->

		<script type="text/javascript">
	// 세션에서 받은 유저 권한
	var userRole ="<%=roleStr%>";
	console.log("사이드바>>>", userRole);

	if(userRole === "ROLE_CUSTOMER"){

		var customerSideBarContent =
				'<ul data-submenu-title="">'
				+'<li><a id="sideBarBookmarks" href="#"><i class="sl sl-icon-heart"></i> 나의 수강 관리</a></li>'
				+'<li class="active"><a id="sideBarMyPage" href="/customer/mypage"><i class="sl sl-icon-user"></i> 마이페이지</a></li>'
				+'<li><a id="sideBarLogout" href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

		document.querySelector('#sidebar').innerHTML = customerSideBarContent;

	} else if(userRole === "ROLE_PROVIDER"){

		var providerSideBarContent =

				'<ul data-submenu-title="">'
				+'<li class="active"><a><i class="sl sl-icon-layers"></i> 나의 수업 관리</a>'
				+'<ul><li><a href="/provider/pending-listing"><span class="nav-tag green"></span>&nbsp;&nbsp;&nbsp;&nbsp;대기중 </a></li>'
				+'<li><a href="/provider/active-listing"><span class="nav-tag yellow"></span>&nbsp;&nbsp;&nbsp;&nbsp;진행중 </a></li>'
				+'<li><a href="/provider/expired-listing"><span class="nav-tag red"></span>&nbsp;&nbsp;&nbsp;&nbsp;완료  </a></li></ul></li>'
				+'<li><a id="sideBarAddListing" href="/provider/add-service"><i class="sl sl-icon-plus"></i> 수업 추가하기</a></li>'
				+'<li class="active"><a id="sideBarMyPage" href="/provider/mypage"><i class="sl sl-icon-user"></i>마이페이지</a></li>'
				+'<li><a id="sideBarLogout" href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

		document.querySelector('#sidebar').innerHTML = providerSideBarContent;
	}
</script>

<!-- Dashboard -->
<div id="dashboard">

	<!-- Navigation
	================================================== -->

	<!-- Navigation / End -->


	<!-- Content
	================================================== -->
	<div class="dashboard-content">

		<!-- Titlebar -->
		<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
					<!--현재 문서 마지막 저장시간 리턴-->
					<script>document.write("현재 문서의 마지막 저장 시간:"+document.lastModified+ "<br />");</script>
					<h2>서비스 만들기</h2>

					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">홈</a></li>
							<li><a href="#">설정</a></li>
							<li>서비스 만들기</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">

				<div id="add-listing">

					<!-- Section -->
					<div class="add-listing-section">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-doc"></i> 기본 정보</h3>
						</div>

						<!-- Title -->
						<div class="row with-forms">
							<div class="col-md-12">
<!--								<h5> 별칭 <i class="tip" data-tip-content="호스트에게만 표시됩니다."></i></h5>-->
<!--								<input class="search-field" type="text" value=""/>-->
								<h5> 이벤트명 <i class="tip" data-tip-content="제공하실 이벤트명을 입력하세요."></i></h5>
								<input class="search-field" id="search-field" type="text" value=""/>
							</div>
						</div>

						<!-- Row -->
						<div class="row with-forms">

							<!-- Status -->
							<div class="col-md-6">
								<h5>카테고리</h5>
								<select class="chosen-select-no-single">
									<option label="blank">카테고리 선택</option>
									<option>요리</option>
									<option>외국어</option>
									<option>헬스/웰빙</option>
									<option>비즈니스</option>
									<option>일상생활</option>
									<option></option>
								</select>

								<!-- Panel Dropdown -->

									<div class="panel-dropdown wide float-left">
										<i class="tip" data-tip-content="선택사항 입니다."></i><a href="#">카테고리 상세 지정</a>
										<script>document.write("현제 페이지 마지막 저장 시간:"+document.lastModified+ "<br />");</script>
										<div class="panel-dropdown-content checkboxes">

											<!-- Checkboxes -->
											<div class="row">
												<div class="col-md-6">
													<div style="margin-bottom: 25px">
														<h4>유형</h4>
														<input id="check-a1" type="checkbox" name="check">
														<label for="check-a1">체험</label>
														<input id="check-b1" type="checkbox" name="check">
														<label for="check-b1">교육</label>
													</div>
													<div>
														<h4>기간</h4>
														<input id="check-c1" type="checkbox" name="check">
														<label for="check-c1">정기</label>
														<input id="check-d1" type="checkbox" name="check">
														<label for="check-d1">비정기</label>
													</div>
												</div>

												<div class="col-md-6">
													<div style="margin-bottom: 25px">
														<h4>규모</h4>
														<input id="check-e1" type="checkbox" name="check" >
														<label for="check-e1">개인(1:1)</label>
														<input id="check-f1" type="checkbox" name="check" >
														<label for="check-f1">그룹(1:N)</label>
													</div>
													<div>
														<h4>장소</h4>
														<input id="check-g1" type="checkbox" name="check" >
														<label for="check-g1">실내</label>
														<input id="check-h1" type="checkbox" name="check" >
														<label for="check-h1">실외</label>
													</div>
												</div>
											</div>
												<script>$('input[type="checkbox"]').on('change', function() {
													$(this).siblings('input[type="checkbox"]').prop('checked', false);
												});</script>
											<!-- Buttons -->
											<div class="panel-buttons">
												<button class="panel-cancel">취소</button>
												<button class="panel-apply">등록</button>
											</div>

										</div>
									</div>

								<!-- Panel Dropdown / End -->
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>해시테그 <i class="tip" data-tip-content="최대 5개의 해시테그를 선택하세요"></i></h5>

<!--								<div type="text" class="tags-input" data-name="tags-input"></div>-->
									<input type="text" id="testInput" />

							</div>
						</div>
						<!-- Row / End -->

					</div>
					<!-- Section / End -->




					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-docs"></i> 이벤트 설명<i class="tip" data-tip-content="게스트가 참여하게 될 이벤트 활동을 구체적으로 설명하세요."></i></h3>

						</div>

						<!-- Description -->
						<div class="form">
							<h5>이벤트 소개<i class="tip" data-tip-content="이벤트를 처음부터 끝까지 실제 진행 순서대로 설명해 주세요."></i></h5>
							<textarea class="WYSIWYG" name="summary" cols="40" rows="3" id="summary" spellcheck="true" placeholder="각 활동에 대한 설명을 실제 진행 순서대로 써주세요."></textarea>
						</div>

						<!-- Row -->
<!--						<div class="row with-forms">-->

<!--							&lt;!&ndash; Phone &ndash;&gt;-->
<!--							<div class="col-md-4">-->
<!--								<h5>휴대폰 번호 <span>(옵션)</span></h5>-->
<!--								<input type="text">-->
<!--							</div>-->

<!--							&lt;!&ndash; Website &ndash;&gt;-->
<!--							<div class="col-md-4">-->
<!--								<h5>홈페이지 <span>(옵션)</span></h5>-->
<!--								<input type="text">-->
<!--							</div>-->

<!--							&lt;!&ndash; Email Address &ndash;&gt;-->
<!--							<div class="col-md-4">-->
<!--								<h5>E-mail <span>(옵션)</span></h5>-->
<!--								<input type="text">-->
<!--							</div>-->

<!--						</div>-->
<!--						&lt;!&ndash; Row / End &ndash;&gt;-->


<!--						&lt;!&ndash; Row &ndash;&gt;-->
<!--						<div class="row with-forms">-->

<!--							&lt;!&ndash; Phone &ndash;&gt;-->
<!--							<div class="col-md-4">-->
<!--								<h5 class="fb-input"><i class="fa fa-facebook-square"></i> 페이스북 <span>(옵션)</span></h5>-->
<!--								<input type="text" placeholder="https://www.facebook.com/">-->
<!--							</div>-->

<!--							&lt;!&ndash; Website &ndash;&gt;-->
<!--							<div class="col-md-4">-->
<!--								<h5 class="twitter-input"><i class="fa fa-twitter"></i> 트위터 <span>(옵션)</span></h5>-->
<!--								<input type="text" placeholder="https://www.twitter.com/">-->
<!--							</div>-->

<!--							&lt;!&ndash; Email Address &ndash;&gt;-->
<!--							<div class="col-md-4">-->
<!--								<h5 class="gplus-input"><i class="fa fa-google-plus"></i> 구글 플러스 <span>(옵션)</span></h5>-->
<!--								<input type="text" placeholder="https://plus.google.com">-->
<!--							</div>-->

<!--						</div>-->
						<!-- Row / End -->

					</div>
					<!-- Section / End -->






					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-picture"></i> 사진</h3>
						</div>

						<!-- Dropzone -->
						<div class="submit-section">
							<form action="/" method="post" class="dropzone" id="my-awesome-dropzone"></form>

							<script>


								$(function(){
									Dropzone.options.myAwesomeDropzone = {
										maxFilesize: 5,
										addRemoveLinks: true,
										dictResponseError: 'Server not Configured',
										acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
										init: function () {
											var self = this;
											// config
											self.options.addRemoveLinks = true;
											self.options.dictRemoveFile = "Delete";
											//New file added
											self.on("addedfile", function (file) {
												console.log('new file added ', file);
											});
											// Send file starts
											self.on("sending", function (file) {
												console.log('upload started', file);
												$('.meter').show();
											});

											// File upload Progress
											self.on("totaluploadprogress", function (progress) {
												console.log("progress ", progress);
												$('.roller').width(progress + '%');
											});

											self.on("queuecomplete", function (progress) {
												$('.meter').delay(999).slideUp(999);
											});

											// On removing file
											self.on("removedfile", function (file) {
												console.log(file);
											});
										}
									};
								})

							</script>
						</div>
<!--						<script src="http://code.jquery.com/jquery-latest.js"></script>-->

<!--						<script type="text/javascript">-->

<!--							// 파일 리스트 번호-->
<!--							var fileIndex = 0;-->
<!--							// 등록할 전체 파일 사이즈-->
<!--							var totalFileSize = 0;-->
<!--							// 파일 리스트-->
<!--							var fileList = new Array();-->
<!--							// 파일 사이즈 리스트-->
<!--							var fileSizeList = new Array();-->
<!--							// 등록 가능한 파일 사이즈 MB-->
<!--							var uploadSize = 5;-->
<!--							// 등록 가능한 총 파일 사이즈 MB-->
<!--							var maxUploadSize = 50;-->

<!--							$(function (){-->
<!--								// 파일 드롭 다운-->
<!--								fileDropDown();-->
<!--							});-->

<!--							// 파일 드롭 다운-->
<!--							function fileDropDown(){-->
<!--								var dropZone = $("#dropZone");-->
<!--								//Drag기능-->
<!--								dropZone.on('dragenter',function(e){-->
<!--									e.stopPropagation();-->
<!--									e.preventDefault();-->
<!--									// 드롭다운 영역 css-->
<!--									dropZone.css('background-color','#E3F2FC');-->
<!--								});-->
<!--								dropZone.on('dragleave',function(e){-->
<!--									e.stopPropagation();-->
<!--									e.preventDefault();-->
<!--									// 드롭다운 영역 css-->
<!--									dropZone.css('background-color','#FFFFFF');-->
<!--								});-->
<!--								dropZone.on('dragover',function(e){-->
<!--									e.stopPropagation();-->
<!--									e.preventDefault();-->
<!--									// 드롭다운 영역 css-->
<!--									dropZone.css('background-color','#E3F2FC');-->
<!--								});-->
<!--								dropZone.on('drop',function(e){-->
<!--									e.preventDefault();-->
<!--									// 드롭다운 영역 css-->
<!--									dropZone.css('background-color','#FFFFFF');-->

<!--									var files = e.originalEvent.dataTransfer.files;-->
<!--									if(files != null){-->
<!--										if(files.length < 1){-->
<!--											alert("폴더 업로드 불가");-->
<!--											return;-->
<!--										}-->
<!--										selectFile(files)-->
<!--									}else{-->
<!--										alert("ERROR");-->
<!--									}-->
<!--								});-->
<!--							}-->

<!--							// 파일 선택시-->
<!--							function selectFile(files){-->
<!--								// 다중파일 등록-->
<!--								if(files != null){-->
<!--									for(var i = 0; i < files.length; i++){-->
<!--										// 파일 이름-->
<!--										var fileName = files[i].name;-->
<!--										var fileNameArr = fileName.split("\.");-->
<!--										// 확장자-->
<!--										var ext = fileNameArr[fileNameArr.length - 1];-->
<!--										// 파일 사이즈(단위 :MB)-->
<!--										var fileSize = files[i].size / 1024 / 1024;-->

<!--										if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml', 'app', 'zip']) >= 0){-->
<!--											// 확장자 체크-->
<!--											alert("등록 불가 확장자");-->
<!--											break;-->
<!--										}else if(fileSize > uploadSize){-->
<!--											// 파일 사이즈 체크-->
<!--											alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");-->
<!--											break;-->
<!--										}else{-->
<!--											// 전체 파일 사이즈-->
<!--											totalFileSize += fileSize;-->

<!--											// 파일 배열에 넣기-->
<!--											fileList[fileIndex] = files[i];-->

<!--											// 파일 사이즈 배열에 넣기-->
<!--											fileSizeList[fileIndex] = fileSize;-->

<!--											// 업로드 파일 목록 생성-->
<!--											addFileList(fileIndex, fileName, fileSize);-->

<!--											// 파일 번호 증가-->
<!--											fileIndex++;-->
<!--										}-->
<!--									}-->
<!--								}else{-->
<!--									alert("ERROR");-->
<!--								}-->
<!--							}-->

<!--							// 업로드 파일 목록 생성-->
<!--							function addFileList(fIndex, fileName, fileSize){-->
<!--								var html = "";-->
<!--								html += "<tr id='fileTr_" + fIndex + "'>";-->
<!--								html += "    <td class='left' >";-->
<!--								html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"-->
<!--								html += "    </td>"-->
<!--								html += "</tr>"-->

<!--								$('#fileTableTbody').append(html);-->
<!--							}-->

<!--							// 업로드 파일 삭제-->
<!--							function deleteFile(fIndex){-->
<!--								// 전체 파일 사이즈 수정-->
<!--								totalFileSize -= fileSizeList[fIndex];-->

<!--								// 파일 배열에서 삭제-->
<!--								delete fileList[fIndex];-->

<!--								// 파일 사이즈 배열 삭제-->
<!--								delete fileSizeList[fIndex];-->

<!--								// 업로드 파일 테이블 목록에서 삭제-->
<!--								$("#fileTr_" + fIndex).remove();-->
<!--							}-->

<!--							// 파일 등록-->
<!--							function uploadFile(){-->
<!--								// 등록할 파일 리스트-->
<!--								var uploadFileList = Object.keys(fileList);-->

<!--								// 파일이 있는지 체크-->
<!--								if(uploadFileList.length == 0){-->
<!--									// 파일등록 경고창-->
<!--									alert("파일이 없습니다.");-->
<!--									return;-->
<!--								}-->

<!--								// 용량을 500MB를 넘을 경우 업로드 불가-->
<!--								if(totalFileSize > maxUploadSize){-->
<!--									// 파일 사이즈 초과 경고창-->
<!--									alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");-->
<!--									return;-->
<!--								}-->

<!--								if(confirm("등록 하시겠습니까?")){-->
<!--									// 등록할 파일 리스트를 formData로 데이터 입력-->
<!--									var form = $('#uploadForm');-->
<!--									var formData = new FormData(form);-->
<!--									for(var i = 0; i < uploadFileList.length; i++){-->
<!--										formData.append('files', fileList[uploadFileList[i]]);-->
<!--									}-->

<!--									$.ajax({-->
<!--										url:"업로드 경로",-->
<!--										data:formData,-->
<!--										type:'POST',-->
<!--										enctype:'multipart/form-data',-->
<!--										processData:false,-->
<!--										contentType:false,-->
<!--										dataType:'json',-->
<!--										cache:false,-->
<!--										success:function(result){-->
<!--											if(result.data.length > 0){-->
<!--												alert("성공");-->
<!--												location.reload();-->
<!--											}else{-->
<!--												alert("실패");-->
<!--												location.reload();-->
<!--											}-->
<!--										}-->
<!--									});-->
<!--								}-->
<!--							}-->
<!--						</script>-->



<!--						<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">-->
<!--							<table class="table" width="100%" border="1px">-->
<!--								<tbody id="fileTableTbody">-->
<!--								<tr>-->
<!--									<td id="dropZone">-->
<!--										사진을 드래그 하세요-->
<!--									</td>-->
<!--								</tr>-->
<!--								</tbody>-->
<!--							</table>-->
<!--						</form>-->

<!--						<a href="#" onclick="uploadFile(); return false;" class="btn bg_01"> 업로드</a>-->

					</div>
					<!-- Section / End -->



					<!-- Section -->
					<div class="add-listing-section margin-top-45">
						
						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-book-open"></i> 계좌정보</h3>
							<!-- Switcher -->
							<label class="switch"><input type="checkbox" checked><span class="slider round"></span></label>
						</div>

						<!-- Switcher ON-OFF Content -->
						<div class="switcher-content">

							<div class="row">
								<div class="col-md-12">
									<table id="pricing-list-container">
										<tr class="pricing-list-item pattern">
											<td>
												<div class="fm-move"><i class="sl sl-icon-cursor-move"></i></div>
												<div class="col-md-5">
												<select class="chosen-select" data-placeholder="은행명" id="chosen-select">
													<option label="은행"></option>
													<option>제주 은행</option>
													<option>신한 은행</option>
													<option>SC제일 은행</option>
													<option>우리 은행</option>
													<option>대구 은행</option>
													<option>광주 은행</option>
													<option>한국씨티 은행</option>
													<option>전북 은행</option>
													<option>KEB하나 은행</option>
													<option>국민 은행</option>
													<option>부산 은행</option>
													<option>경남 은행</option>
													<option>케이뱅크 은행</option>
													<option>한국카카오 은행</option>
													<option>한국산업 은행</option>
													<option>농협 은행</option>
													<option>기업 은행</option>
													<option>한국수출입 은행</option>
													<option>수협 은행</option>
												</select>
												</div>
												<div class="col-md-5">
												<div class="fm-input pricing-ingredients"><input type="text" placeholder="계좌번호" id="account_num" /></div></div>

<!--												<div class="fm-input pricing-price"><input type="text" placeholder="Price" data-unit="USD" /></div>-->
<!--												<div class="fm-close"><a class="delete" href="#"><i class="fa fa-remove"></i></a></div>-->

											</td>
										</tr>
									</table>
<!--									<a href="#" class="button add-pricing-list-item">은행 및 계좌 추가</a>-->
<!--									<a href="#" class="button add-pricing-submenu">Add Category</a>-->
								</div>
							</div>

						</div>
						<!-- Switcher ON-OFF Content / End -->

					</div>
					<!-- Section / End -->


					<a class="button preview" id="button save"> 저장하기<i class="fa fa-arrow-circle-right"></i></a>
<!--					<a href="#" class="button preview" onclick="return checkExistData()">저장하기 <i class="fa fa-arrow-circle-right"></i></a>-->
					

				</div>
			</div>

			<!-- Copyrights -->
			<div class="col-md-12">
				<div class="footer-copyright text-center py-3"> © 2019 BucketList. All Rights Reserved.</div>
			</div>

		</div>

	</div>
	<!-- Content / End -->


</div>
<!-- Dashboard / End -->


</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script type="text/javascript" src="/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/js/mmenu.min.js"></script>
<script type="text/javascript" src="/js/chosen.min.js"></script>
<script type="text/javascript" src="/js/slick.min.js"></script>
<script type="text/javascript" src="/js/rangeslider.min.js"></script>
<script type="text/javascript" src="/js/magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/waypoints.min.js"></script>
<script type="text/javascript" src="/js/counterup.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/tooltips.min.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<script type="text/javascript" src="/js/apis.js"></script>

<!-- Opening hours added via JS (this is only for demo purpose) -->
<script>
$(".opening-day.js-demo-hours .chosen-select").each(function() {
	$(this).append(''+
        '<option></option>'+
        '<option>Closed</option>'+
        '<option>1 AM</option>'+
        '<option>2 AM</option>'+
        '<option>3 AM</option>'+
        '<option>4 AM</option>'+
        '<option>5 AM</option>'+
        '<option>6 AM</option>'+
        '<option>7 AM</option>'+
        '<option>8 AM</option>'+
        '<option>9 AM</option>'+
        '<option>10 AM</option>'+
        '<option>11 AM</option>'+
        '<option>12 AM</option>'+
        '<option>1 PM</option>'+
        '<option>2 PM</option>'+
        '<option>3 PM</option>'+
        '<option>4 PM</option>'+
        '<option>5 PM</option>'+
        '<option>6 PM</option>'+
        '<option>7 PM</option>'+
        '<option>8 PM</option>'+
        '<option>9 PM</option>'+
        '<option>10 PM</option>'+
        '<option>11 PM</option>'+
        '<option>12 PM</option>');
});
</script>

<!-- 각 데이터를 모아서 JSON으로 가공 -->
<script>
/* 	//바로 등록하기버튼 눌렀을때 json 전달
	var btnEle = document.getElementById("button regist");
	btnEle.addEventListener("click",function (){
		firstServiceRegister();
	});
*/

	// 저장하기버튼 눌렀을때 json 전달
	var btnEle = document.getElementById("button save");
	btnEle.addEventListener("click",function (){
		var sendJson = firstServiceSave();
		Apis.postRequest(`/provider/add-service`, sendJson).then(response => {
			if(response.res === "success"){
				alert("나의 수업 템플릿에 저장 되었습니다!");
				location.href = "/provider/pending-listing";
			} else {
				alert("다시 작성해주세요");
			}
		});
	}); 


</script>
<script>

    var userRoleData ="<%=roleStr%>";
    var getNickName = "<%=memberNickname%>";
    var getImgUri = "<%=memberImgUri%>";

    console.log("대쉬보드버전>>>", userRoleData);
    console.log("대쉬보드버전>>>", getNickName);
    console.log("대쉬보드버전>>>", getImgUri);

    if (userRoleData === "ROLE_CUSTOMER") {

        var headerContentCustomer = '<div class="user-name"><span><img src="../img/' + getImgUri + '" alt=""></span>'
            + getNickName
            + '님에게 맞는 수업을 만나보세요!</div>'
            + '<ul><li><a href="/customer/mypage"><i class="sl sl-icon-settings"></i> 마이페이지</a></li>'
            + '<li><a href=#><i class="fa fa-calendar-check-o"></i> 나의 수강 관리</a></li>'
            + '<li><a href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

        console.log(headerContentCustomer);
        document.querySelector('#user-menu').innerHTML = headerContentCustomer;

    } else if (userRoleData === "ROLE_PROVIDER") {

        var headerContentProvider = '<div class="user-name"><span><img src="../img/' + getImgUri + '" alt=""></span>'
            + getNickName
            + '님만의 수업을 개설해보세요!</div>'
            + '<ul><li><a href="/provider/mypage"><i class="sl sl-icon-settings"></i> 마이페이지</a></li>'
            + '<li><a href="/provider/active-listing"><i class="fa fa-calendar-check-o"></i> 나의 수업 관리</a></li>'
            + '<li><a href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

        console.log(typeof headerContentProvider, headerContentProvider);
        document.querySelector('#user-menu').innerHTML = headerContentProvider;

    } else {
        var headerContent = '<a href="/login" class="sign-in">로그인</a>'
            + '<a href="/signup" class="sign-in">회원가입</a>';

        console.log(headerContent);
        document.querySelector('#user-menu').innerHTML = headerContent;
    }
	</script>
<!-- DropZone | Documentation: http://dropzonejs.com -->
<script type="text/javascript" src="/js/dropzone.js"></script>
<!-- hashtag js-->
<script type="text/javascript" src="/js/tags.js"></script>
<!-- my custom js -->
<script type="text/javascript" src="/js/custom.song.js"></script>


</body>
</html>
<!-- 별칭 테이블이 없어서 주석처리함. 휴대폰번호, 홈페이지, email, 트위터 등 부분 사용하는 부분 없어서 주석처리함.-->
<!-- 계좌번호 varchar여서 input type을 text로 수정 -->
<!-- 계좌 및 계좌번호 단일로만 받기로 해서 add 버튼 삭제cv -->