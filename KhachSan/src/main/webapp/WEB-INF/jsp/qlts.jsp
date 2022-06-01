<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<!-- thông báo lỗi ngoại lệ form -->
	<frm:form modelAttribute="thongSoTheoGio">
		<c:if test="${not empty errors }">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Lỗi!</strong>

				<p>
					<frm:errors path="*"></frm:errors>
				</p>

			</div>
		</c:if>
	</frm:form>
	<!-- thông báo khi sửa hoặc xóa thành công -->
	<c:if test="${not empty message }">
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>

			<strong>${message }</strong>
		</div>
	</c:if>
</div>
<div class="container">
	<div class="breadcrumb" style="box-shadow: 1px 1px 5px #888888;">
		<div>
			<frm:form action="updategiaodien" modelAttribute="giaoDien">
				<h5>
					<b>Giao diện</b>
				</h5>
				<hr>
				<div class="form-group">
					<label for="tenToChuc" style="font-weight: bold;">Tên nhà nghỉ / khách sạn</label>

					<div class="col-sm-10">
						<frm:input id="tenToChuc" class="form-control"
							path="tenToChuc" placeholder="Nhập tên nhà nghỉ / khách sạn"
							required="required" maxlength="25" />
							<p style="color: darkgray;">** Hiển thị trên web và in hóa đơn.</p>
					</div>
				</div>
				<div class="form-group">
					<label for="diaChi" style="font-weight: bold;">Địa chỉ</label>

					<div class="col-sm-10">
						<frm:input id="diaChi" class="form-control"
							path="diaChi" placeholder="Nhập địa chỉ nhà nghỉ / khách sạn"
							required="required" maxlength="60" />
							<p style="color: darkgray;">** Hiển thị trên hóa đơn.</p>
					</div>
				</div>
				<div class="form-group">
					<label for="soDienThoai" style="font-weight: bold;">Số điện thoại</label>

					<div class="col-sm-10">
						<frm:input type="number" id="soDienThoai" class="form-control"
							path="soDienThoai" placeholder="Nhập số điện thoại"
							required="required" oninput="checkMaxLenghtNumber(this,20)" />
							<p style="color: darkgray;">** Hiển thị trên hóa đơn.</p>
					</div>
				</div>
				<div class="container">
					<frm:button type="submit" class="btn btn-success btn-xs">Cập nhật</frm:button>
				</div>
			</frm:form>
		</div>
	</div>
</div>

<div class="container">
	<div class="breadcrumb" style="box-shadow: 1px 1px 5px #888888;">
		<div>
			<frm:form action="updatets" modelAttribute="thongSoTheoGio">
				<h5>
					<b>Thông số thuê theo giờ</b>
				</h5>
				<hr>
				<frm:hidden id="maThongSo" class="form-control" path="maThongSo" />
				<div class="form-group">
					<label for="baoNhieuGioDau" style="font-weight: bold;">Số
						giờ đầu: </label>

					<div class="col-sm-10">
						<frm:input type="number" id="baoNhieuGioDau" class="form-control"
							path="baoNhieuGioDau" placeholder="Nhập số giờ đầu"
							required="required" oninput="checkMaxLenghtNumber(this,9)" />
						<p style="color: darkgray;">** ${thongSoTheoGio.baoNhieuGioDau }
							giờ đầu 50k, từ giờ sau trở đi chỉ còn 20k/giờ.</p>
					</div>
				</div>
				<div class="form-group">
					<label for="soGioChuyenThanhNgay" style="font-weight: bold;">Số
						giờ chuyển thành thuê ngày: </label>
					<div class="col-sm-10">
						<frm:input type="number" id="soGioChuyenThanhNgay"
							class="form-control" path="soGioChuyenThanhNgay"
							placeholder="Nhập số giờ" required="required"
							oninput="checkMaxLenghtNumber(this,9)" />
						<p style="color: darkgray;">** Quá
							${thongSoTheoGio.soGioChuyenThanhNgay } giờ thì chuyển từ loại
							thuê theo giờ sang loại thuê theo ngày.</p>
					</div>
				</div>
				<div class="container">
					<frm:button type="submit" class="btn btn-success btn-xs">Cập nhật</frm:button>
				</div>
			</frm:form>
		</div>
	</div>
</div>