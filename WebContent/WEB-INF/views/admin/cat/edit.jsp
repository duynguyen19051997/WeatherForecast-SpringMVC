<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thêm danh mục</div>
             </div>
             <div class="content-box-large box-with-header">
	             	 <c:if test="${not empty msg}">
			       	 	<h4 class="text-danger">${msg}</h4>
			    	</c:if>
			    	<form:errors path="objCat.*" cssClass="error"></form:errors>
	                 <div>
                 	<form action="" method="post">
                     <div class="row mb-10"></div>
                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="name">Tên danh mục</label>
                                 <input name="cname" type="text" class="form-control" value='<c:if test="${not empty objCat}">${objCat.cname}</c:if>' placeholder="Nhập tên Danh mục">
                             </div>
                         </div>
                         
                     </div>
                     <!-- <hr> -->

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Sửa" class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>
					</form>
                 </div>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->
<script>
    document.getElementById("cat").classList.add('active-menu');
</script>