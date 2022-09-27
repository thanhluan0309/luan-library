<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>Upload file</title>
<style>
.form-group {
	margin: 10px;
}
</style>
</head>
<body>
	<h2>NỘP ĐƠN XIN VIỆC</h2>
	${message}
	<form action="apply" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<div>Họ và tên ứng viên</div>
			<input type="text" name="fullname">
		</div>
		<div class="form-group">
			<div>Hình ảnh</div>
			<input type="file" name="photo">
		</div>
		<div class="form-group">
			<div>Hồ sơ xin việc</div>
			<input type="file" name="cv">
		</div>
		<div class="form-group">
			<button>Nộp</button>
		</div>
	</form>
</body>
</html>
