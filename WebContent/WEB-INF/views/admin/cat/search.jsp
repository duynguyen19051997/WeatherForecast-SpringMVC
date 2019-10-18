<%@page import="duynguen.model.dao.LandDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Kết quả tìm kiếm</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/cat/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

    </div>
    <div class="col-md-4">
        <form id="search" action="${pageContext.request.contextPath}/admin/cat/search" method="get">
        	<div class="input-group form">
	            <input type="text" name="search" value='<c:if test="${not empty search}">${search}</c:if>' class="form-control" placeholder="Search...">
	            <span class="input-group-btn">
	     			<button class="btn btn-primary" type="submit">Search</button>
	   			</span>
        	</div>
        </form>
        <script type="text/javascript">
        	$(document).ready(function(){
        		$('#search').validate({
        			rules:{
        				search:{
        					required:true
        				}
        			},
        			messages:{
        				search:{
        					required:'Vui lòng không để trống!'
        				}
        			},
        		});
        	});
       	</script>
    </div>
</div>

<div class="row">
    <div class="panel-body">
    	<c:if test="${not empty msg}">
       	 	<h4 class="text-danger">${msg}</h4>
    	</c:if>
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th style="text-align: center;">ID</th>
                    <th style="text-align: center;">Tên</th>
                    <th style="text-align: center;">Các tin thuộc danh mục</th>
                    <th style="text-align: center;">Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listSearch}">
            		<c:forEach items="${listSearch}" var="objCat">
            			<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/cat/delete/${objCat.cid}"></c:set>
            			<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/cat/edit/${objCat.cid}"></c:set>
            			<tr class="odd gradeX">
		                    <td style="text-align: center;">${objCat.cid}</td>
		                    <td style="text-align: center;">${objCat.cname}</td>
		                    <td style="text-align: center;">${landDao.totalLanByCid(objCat.cid)}</td>
		                    <td class="center text-center">
		                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                        <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                    </td>
	               		 </tr>
            		</c:forEach>
            	</c:if>
            	<c:if test="${empty listSearch}">
            		<tr>
            			<td colspan="3"><h5 style="text-align: center;">Từ khóa bạn tìm không có</h5></td>
            		</tr>
            	</c:if>
            </tbody>
        </table>

        <!-- Pagination -->
    <!-- <nav class="text-center" aria-label="...">
        <ul class="pagination">
            <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        </ul>
    </nav> -->
    <!-- /.pagination -->

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
    document.getElementById("cat").classList.add('active-menu');
</script>