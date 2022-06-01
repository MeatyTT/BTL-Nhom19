<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.imgpdf {
	cursor: pointer;
}
</style>
<div class="container" style="margin-top: 15px; display: inline-block;">
	<div class="bangtinhtien">
		<table class="table" style="font-size: 15px;">
			<tr>
				<th colspan="2" style="text-align: center; font-size: 18px;">Bảng tính tiền</th>
			</tr>
			<tr>
				<th>Tiền cọc</th>
				<th><fmt:formatNumber type="number" pattern="###,###" value="${tiencoc }" /> VNĐ</th>
			</tr>
			<tr>
				<th>Tiền phòng</th>
				<th class="tienphong"><fmt:formatNumber type="number" pattern="###,###" value="${tongTiendp }" /> VNĐ</th>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ngày đặt</td>
				<td><fmt:formatDate pattern="d/M/yyyy" value="${getdatphong.ngayDat }" /></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Giờ đặt</td>
				<td><fmt:formatDate pattern="HH:mm" value="${getdatphong.gioDat }" /></td>
			</tr>
			<tr>
				<td class="ThoiGianThueLable">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${getdatphong.loaiDat=='theongay' || getdatphong.loaiDat=='homestay'}">Số ngày đã thuê</c:if> <c:if
						test="${getdatphong.loaiDat=='theogio'}"
					>Số giờ đã thuê</c:if></td>
				<td class="ThoiGianThueValue"><c:if test="${getdatphong.loaiDat=='theongay' || getdatphong.loaiDat=='homestay'}">${songaythue } ngày</c:if> <c:if test="${getdatphong.loaiDat=='theogio'}">${soGioThue } giờ</c:if></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Đã giảm giá</td>
				<td>${giamgia }%</td>
			</tr>
			<tr>
				<th>Tiền dịch vụ</th>
				<th><fmt:formatNumber type="number" pattern="###,###" value="${tongTiendv }" /> VNĐ</th>
			</tr>
			<c:forEach var="u" items="${listdv }">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${u.dichVu.tenDichVu } x${u.soLuong }</td>
					<td><fmt:formatNumber type="number" pattern="###,###" value="${u.dichVu.giaDichVu*u.soLuong }" /> VNĐ</td>
				</tr>
			</c:forEach>
			<tr style="color: red;">
				<th>Tổng tiền cần thanh toán</th>
				<th class="tongTienTrai"><fmt:formatNumber type="number" pattern="###,###" value="${tongTien }" /> VNĐ</th>
			</tr>
		</table>
	</div>
	
	<div id="pdf" class="bangpdf">
		<table class="table" style="font-size: 15px;">
		<tr>
				<th colspan="2" style="text-align: center; font-size: 24px;"><span style="text-transform: uppercase;">${tenToChuc }</span></th>
			</tr>
			<tr>
				<td style="font-size: 13px; text-align: left;padding-top: 0; border-top: none;">Địa chỉ: ${diaChi }</td>
				<td style="font-size: 13px; text-align: right;padding-top: 0; border-top: none;">Tel: ${soDienThoai }</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: center; font-size: 18px;border-top: none;">HÓA ĐƠN</th>
			</tr>
			<tr>
				<th>Tiền cọc</th>
				<th><fmt:formatNumber type="number" pattern="###,###" value="${tiencoc }" /> VNĐ</th>
			</tr>
			<tr>
				<th>Tiền phòng</th>
				<th class="tienphong"><fmt:formatNumber type="number" pattern="###,###" value="${tongTiendp }" /> VNĐ</th>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ngày đặt</td>
				<td><fmt:formatDate pattern="d/M/yyyy" value="${getdatphong.ngayDat }" /></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Giờ đặt</td>
				<td><fmt:formatDate pattern="HH:mm" value="${getdatphong.gioDat }" /></td>
			</tr>
			<tr>
				<td class="ThoiGianThueLable">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${getdatphong.loaiDat=='theongay' || getdatphong.loaiDat=='homestay'}">Số ngày đã thuê</c:if> <c:if
						test="${getdatphong.loaiDat=='theogio'}"
					>Số giờ đã thuê</c:if></td>
				<td class="ThoiGianThueValue"><c:if test="${getdatphong.loaiDat=='theongay' || getdatphong.loaiDat=='homestay'}">${songaythue } ngày</c:if> <c:if test="${getdatphong.loaiDat=='theogio'}">${soGioThue } giờ</c:if></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Đã giảm giá</td>
				<td>${giamgia }%</td>
			</tr>
			<tr>
				<th>Tiền dịch vụ</th>
				<th><fmt:formatNumber type="number" pattern="###,###" value="${tongTiendv }" /> VNĐ</th>
			</tr>
			<c:forEach var="u" items="${listdv }">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${u.dichVu.tenDichVu } x${u.soLuong }</td>
					<td><fmt:formatNumber type="number" pattern="###,###" value="${u.dichVu.giaDichVu*u.soLuong }" /> VNĐ</td>
				</tr>
			</c:forEach>
			<tr style="color: red;">
				<th>Tổng tiền cần thanh toán</th>
				<th class="tongTienTrai"><fmt:formatNumber type="number" pattern="###,###" value="${tongTien }" /> VNĐ</th>
			</tr>
		</table>
	</div>
	
	<div class="breadcrumb formtinhtien">
		<frm:form action="actiontraphong" modelAttribute="traphong">
			<frm:hidden path="datPhong.maDatPhong" value="${maDatPhong }" />
			<frm:hidden path="tongTien" value="${tongTien }" />
			<input id="maPhong" type="hidden" name="maPhong" value="${maPhong }">
			<div class="form-group">
				<label for="gioTra" style="font-weight: bold;">Giờ trả:</label>
				<frm:input id="gioTra" class="form-control" path="gioTra" type="time" value="${giohientai }" required="required" onblur="changeTime()" />
			</div>
			<div class="form-group">
				<label for="ngayTra" style="font-weight: bold;">Ngày trả:</label>
				<frm:input id="ngayTra" class="form-control" path="ngayTra" type="date" value="${ngayhientai }" max="9999-12-31" required="required" onblur="changeTime()" />
			</div>
			<div class="form-group">
				<label id="tongTienPhai" for="tongtien" style="font-weight: bold; color: red; font-size: 18px;">Tổng tiền cần thanh toán:&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="number" pattern="###,###"
						value="${tongTien }"
					/> VNĐ
				</label>
			</div>
			<img class="imgpdf" style="-webkit-filter: drop-shadow(1px 1px 2px #888888); filter: drop-shadow(1px 1px 2px #888888); float: left;" src='hinh/pdficon.png' width="35px" height="40px"
				onclick="downloadPdf()"
			>
			<button type="button" class="btn btn-success btn-xs float-right" data-toggle="modal" data-target="#myModala">Hoàn tất</button>
			<!-- Modal submit tra phong -->
			<div class="modal fade" id="myModala" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" style="font-weight: bold;">Xác nhận trả phòng</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<h6>
								Bạn muốn trả phòng <strong>${sophong }</strong>?
							</h6>
						</div>
						<input id="soPhong" type="hidden" value="${sophong }"> <input id="trangThai" type="hidden" value="${trangThai }">
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
							<button class="btn btn-success" style="">Đồng ý</button>
						</div>
					</div>
				</div>
			</div>
		</frm:form>
	</div>
</div>

<script type="text/javascript" src="/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/js/jspdf.min.js"></script>
<script type="text/javascript" src="/js/tp.js"></script>
<script type="text/javascript" src="/js/downloadpdf.js"></script>