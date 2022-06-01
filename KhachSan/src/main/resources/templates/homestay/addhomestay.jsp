<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<!-- thông báo lỗi ngoại lệ form -->
	<frm:form modelAttribute="datphong">
		<c:if test="${not empty errors }">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>Lỗi!</strong>
				<p>
					<frm:errors path="*"></frm:errors>
				</p>
			</div>
		</c:if>
	</frm:form>
	<!-- thông báo khi sửa hoặc xóa thành công -->
	<c:if test="${not empty message }">
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>${message }</strong>
		</div>
	</c:if>
</div>
<div class="container">
<button type="button" class="btn btn-success" style="margin-bottom: 10px;" onclick="backlisthomestay(${maPhong},${soPhong})">Quay Lại</button>
	<div class="breadcrumb" style="box-shadow: 1px 1px 5px #888888;">
		<div>
			<frm:form action="actionaddhomestay" modelAttribute="datphong">
			<input id="maPhong" type="hidden" name="maPhong" value="${maPhong }">
			<input id="soPhong" type="hidden" name="soPhong" value="${soPhong }">
				<frm:hidden path="phong.maPhong" value="${maPhong }" />
				<frm:hidden path="tenDangNhap" value="${nguoidung }" />
				<div class="form-group">
					<label for="hoTen" style="font-weight: bold;">Họ tên khách hàng:</label>
					<frm:input id="hoTen" class="form-control" path="hoTen" placeholder="Nhập họ và tên" maxlength="100" required="required" />
				</div>
				<div class="form-group">
					<label for="soDT" style="font-weight: bold;">Số điện thoại:</label>
					<frm:input id="soDT" type="number" class="form-control" path="soDT" placeholder="Nhập số điện thoại" oninput="checkMaxLenghtNumber(this,15)" required="required" />
				</div>
				<div class="form-group">
					<label for="soCMND" style="font-weight: bold;">Số chứng minh:</label>
					<frm:input id="soCMND" type="number" class="form-control" path="soCMND" placeholder="Nhập số chứng minh" oninput="checkMaxLenghtNumber(this,20)" required="required" />
				</div>
				
				<frm:hidden path="loaiDat" value="homestay" />
				
				<div class="form-group">
					<label for="tienCoc" style="font-weight: bold;">Tiền cọc:</label>
					<frm:input id="tienCoc" type="number" class="form-control" path="tienCoc" placeholder="Nhập tiền cọc" required="required" oninput="checkMaxLenghtNumber(this,12)" />
				</div>
				<div class="form-group">
					<label for="gioDat" style="font-weight: bold;">Giờ đặt:</label>
					<frm:input id="gioDat" class="form-control" path="gioDat" type="time" value="${giohientai }" required="required" />
				</div>
				<div class="form-group">
					<label for="ngayDat" style="font-weight: bold;">Ngày đặt:</label>
					<frm:input id="ngayDat" class="form-control" path="ngayDat" type="date" value="${ngayhientai }" max="9999-12-31" required="required" />
				</div>
				<frm:button type="submit" class="btn btn-success btn-xs float-right">Hoàn tất</frm:button>
			</frm:form>
		</div>
	</div>
</div>
<script type="text/javascript">
function backlisthomestay(maPhong,soPhong) {
	window.location="/homestay?maPhong=" + maPhong + "&soPhong="+ soPhong;
}
</script>
