<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../common.css">

<style>
.title { padding-top:36px; padding-bottom:20px; text-align:center; font-size:25px;}
.form-row { font-size:13px; }
.form-control { font-size:13px; }
.btn-group { padding-left:450px; }
#cusId { width:780px; float:left; margin-right:30px; margin-left:6px; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content container" id="content">
	<h2 class="title">회원가입</h2>
	<form name="frm1" id="frm1" action="../InsertCustomCtrl" method="post" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<div class="form-row">
							<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="form-control" autofocus required />
							<input type="button" class="btn btn-outline-dark" value="아이디 중복 확인" onclick="idCheck()">
							<input type="hidden" name="idck" id="idck" value="no">
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="cusPw" id="cusPw" placeholder="비밀번호 입력" class="form-control" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="cusPw2" id="cusPw2" placeholder="비밀번호 입력" class="form-control" required /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="cusName" id="cusName" placeholder="이름 입력" class="form-control" required /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" required /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required /><br>
					<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
					<button id="post_btn" onclick="findAddr()" class="btn btn-outline-dark">우편번호 검색</button>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="tel" id="tel" placeholder="전화번호 입력 000-0000-0000" class="form-control" required></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-outline-dark" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" name="reset-btn" class="btn btn-outline-dark" value="취소">&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<%=request.getContextPath() %>/custom/login.jsp" class="btn btn-outline-dark">로그인</a>
		</div>
	</form>	
	<script>
	function idCheck(){
		if($("#id").val()==""){
			alert("아이디를 입력하지 않으셨습니다");
			$("#id").focus();
			return;
			}
			var params = { id : $("#id").val()}
			
			$.ajax({
				url:"${path1 }/IdCheckCtrl.do",
				type:"post",
				dataType:"json",
				data:params,
				success:function(result){
					console.log(result.result);
					var idChk = result.result;
					if(idChk==false){
						$("#idck").val("no");
						$("#msg").html("<strong style='color:red'>사용중인 아이디입니다 다른 아이디를 입력해주십시오</strong>");
						$("#id").focus();
					} else if(idCk==true){
						$("#idck").val("yes");
						$("#msg").html("<strong style='color:blue'>사용 가능한 아이디입니다</strong>");
					}
				}
			}};
		}
		function joinCheck(f){
			if(f.pw.value!=f.pw2.value){
				alert("비밀번호와 비밀번호 확인이 서로 다릅니다");
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>