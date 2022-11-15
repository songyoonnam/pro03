<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진 업로드</title>
</head>
<body>

<form name="upload" id="upload" action="${path1 }/ImgUploadCtrl.do" method="post">
	<table class="table">
		<tr>
			<th>위치</th>
			<td>
				<input type="number" name="pos" id="pos" class="input" value="">
			</td>
		</tr>
		<tr>
			<th>장소 번호</th>
			<td>
				<input type="text" name="tourno" id="tourno" class="input" value="">
			</td>
		</tr>
		<tr>
			<th>업로드 파일</th>
			<td>
			<input class="input is-success" type="text" placeholder="파일 업로드">
			</td>
		</tr>
	
	</table>

</form>


</body>
</html>