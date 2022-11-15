<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장소 추가</title>
</head>
<body>

<section>
<div>
<div>
<script>

	function changeTourNo(){
		var cate = document.frm1.cate.value;
		if(cate==""){
			alert("카테고리를 선택하지 않으셨습니다");
			document.frm1.cate.focus();
			return;
		}
		$.ajax({url:"${path1}/NoLoadCtrl.do",
			type:"post",
			datatype:"json",
			success:function(data){
				console.log(data.no);
				$("#tourno").val(cate+data.no);
			}
	});
}

</script>
</div>
</div>
</section>

</body>
</html>