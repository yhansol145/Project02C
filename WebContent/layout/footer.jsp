<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp</title>
<!--  <link rel="stylesheet" href="../css/style-footer.css"> -->
<style>
footer {
	bottom: 0;
}

.footer-black {
	margin-top: 100px;
	padding: 20px 0px;
	height: 350px;
	background-color: #1e1e1e;
	display: block;
}

.footer-division-1 {
	padding-bottom: 40px;
	border-bottom: 1px solid #333;
}

.footer-division-2 {
	padding-top: 40px;
}

.footer-tel {
	color: white;
	font-size: 32px;
	margin-bottom: 10px;
	font-weight: bold;
}

.footer-text {
	color: #e2e2e2;
	font-size: 13px; 
	opacity: 0.56;
	font-weight: 500;
}

.footer-link-company {
	margin-top: 10px;
	color: white;
	font-weight: bold;
	font-size: 18px;
}

.footer-sep {
	font-size: 13px;
}
</style>
</head>
<body>
	<footer class="footer-black">
		<div class="frame" style="margin-left: 40px">

			<!-- Division 1 -->
			<div class="footer-division-1">
				<div class="footer-tel">고객센터 010 - 6775 - 5529</div>
				<div class="footer-text">영업시간 : am 09:00 ~ pm 18:00 (주말휴무)</div>
				<div class="footer-text">점심시간 : pm 12:00 ~ pm 14:00</div>
			</div>

			<!-- Division 2 -->
			<div class="footer-division-2">
				<div class="footer-text">주소 : 경기도 고양시 화신로</div>
				<div class="footer-text">회사명 : (주)HansolShop | 대표 : 유한솔</div>
				<div class="footer-link-company">
					<a>이용약관</a> <span class="footer-sep"> | </span> <a>개인정보처리방침</a> <span
						class="footer-sep"> | </span> <a>사업자정보확인</a>
				</div>
			</div>
		</div>

	</footer>
</body>
</html>