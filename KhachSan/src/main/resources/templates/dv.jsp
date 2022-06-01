<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div id="messageCustom" class="alert alert-danger" style="display: none">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>Tên dịch vụ hoặc giá dịch vụ không được trống.</strong>
	</div>
	<!-- thông báo khi sửa hoặc xóa thành công -->
	<c:if test="${not empty message }">
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>${message }</strong>
		</div>
	</c:if>
	<frm:form action="actionloaidichvu">
		<div align="center">
			<hr>
			<button class="btn btn-info" type="submit" name="anuong" style="width: 190px; height: 45px; box-shadow: 1px 1px 1px #888888;margin: 2px;">Ăn uống</button>
			<button class="btn btn-info" type="submit" name="giatui" style="width: 190px; height: 45px; box-shadow: 1px 1px 1px #888888;margin: 2px;">Giặt ủi</button>
			<button class="btn btn-info" type="submit" name="thugian" style="width: 190px; height: 45px; box-shadow: 1px 1px 1px #888888;margin: 2px;">Thư giãn</button>
			<button class="btn btn-info" type="submit" name="khac" style="width: 190px; height: 45px; box-shadow: 1px 1px 1px #888888;margin: 2px;">Khác</button>
		</div>
	</frm:form>
	<hr>
	<c:if test="${empty width }">
	<div class="inputdv-mobile"><jsp:include page="${param.view }"></jsp:include></div>
	<div class="overflowdv">
		<table>
			<tr>
				<td class="nhapdv" valign="top"><jsp:include page="${param.view }"></jsp:include></td>
				<td class="bangdv" align="center"></c:if>
					<div class="overflowdv1" style=" height: auto; width: <c:if test="${not empty width }">100%</c:if><c:if test="${empty width }">750px</c:if>;">
						<table class="table table-striped borderdv css-serial" style="width: <c:if test="${not empty width }">100%</c:if><c:if test="${empty width }">500px</c:if>;margin-bottom: 0;">
							<thead>
								<tr>
									<th colspan="6" style="text-align: center;">Danh sách dịch vụ đã đặt</th>
								</tr>
								<tr>
								<th></th>
									<th style="min-width: 150px">Tên DV</th>
									<th style="min-width: 150px">Loại DV</th>
									<th style="min-width: 150px">Số lượng</th>
									<th style="min-width: 150px">Đơn giá</th>
									<th style="min-width: 150px">Thành tiền</th>
									<th style="min-width: 150px">Thông tin thêm</th>
									<th style="min-width: 150px">Nhân viên</th>
									<th style="min-width: 150px">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${l }">
									<tr>
									<td></td>
										<td style="white-space: nowrap;">${u.dichVu.tenDichVu }</td>
										<td style="white-space: nowrap;"><c:if test="${u.dichVu.loaiDichVu==0 }">Ăn uống</c:if> <c:if test="${u.dichVu.loaiDichVu==1 }">Giặt ủi</c:if> <c:if test="${u.dichVu.loaiDichVu==2 }">Thư giãn</c:if> <c:if
												test="${u.dichVu.loaiDichVu==3 }"
											>Khác</c:if></td>
										<td style="white-space: nowrap;">${u.soLuong }</td>
										<td style="white-space: nowrap;"><fmt:formatNumber type="number" pattern="###,###" value="${u.dichVu.giaDichVu }" /> VNĐ</td>
										<td style="white-space: nowrap;"><fmt:formatNumber type="number" pattern="###,###" value="${u.soLuong * u.dichVu.giaDichVu }" /> VNĐ</td>
										<td style="white-space: nowrap;">${u.thongTinThem }</td>
										<td style="white-space: nowrap;">${u.tenDangNhap }</td>
										<td style="white-space: nowrap;"><button type="button" class="btn btn-danger btn-sm" style="text-align: center; width: 89px; height: 28px" data-toggle="modal" data-target="#myModalxoa${u.maDonDichVu }">
												<i class="fa fa-trash-o"></i> Xóa
											</button></td>
									</tr>
									<!-- Modal xoa -->
									<div class="modal fade" id="myModalxoa${u.maDonDichVu }" role="dialog">
										<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" style="font-weight: bold;">Xóa dịch vụ</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
													<h6>
														Bạn muốn xóa <strong>${u.dichVu.tenDichVu }</strong>?
													</h6>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
													<a href="deletedvdd?id=${u.maDonDichVu }" class="btn btn-success">Đồng ý</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</tbody>
							<tr>
								<th colspan="5" style="text-align: right;">Tổng:</th>
								<th colspan="4"><fmt:formatNumber type="number" pattern="###,###" value="${sum }" /> VNĐ</th>
							</tr>
						</table>
					</div> <c:if test="${empty width }"></td>
			</tr>
		</table>
		</div>
	</c:if>
</div>
