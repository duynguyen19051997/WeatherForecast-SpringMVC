<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thông tin người dùng</div>
             </div>
             <div class="content-box-large box-with-header">
	             	 <c:if test="${not empty msg}">
			    		<h4 class="text-danger">${msg}</h4>
			    	</c:if>
	                 <div>
	                     <div class="row mb-10"></div>
	                     <div class="row">
	                         <div class="col-sm-6">
	                             <div class="form-group">
	                                 <label for="password">Username</label>
	                                 <input name="password" type="text" class="form-control" value='<c:if test="${not empty inforUser}">${inforUser.username}</c:if>' disabled="disabled">
	                             </div>
	                             <div class="form-group">
	                                 <label for="password">Fullname</label>
	                                 <input name="password" type="text" class="form-control" value='<c:if test="${not empty inforUser}">${inforUser.fullname}</c:if>' disabled="disabled">
	                             </div>
	                             <div class="form-group">
	                                 <label for="enable">Enable</label>
	                                 <input name="enable" type="text" class="form-control" value='<c:if test="${not empty inforUser}">${inforUser.enable}</c:if>' disabled="disabled">
	                             </div>
	                             <div class="form-group">
	                                 <label for="enable">Chức năng</label>
	                                 <input name="enable" type="text" class="form-control" value='<c:if test="${not empty inforUser}">${inforUser.name}</c:if>' disabled="disabled">
	                             </div>
	                         </div>
	                         
	                     </div>
	                     <!-- <hr> -->
	                 </div>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->
<script>
    document.getElementById("profile").classList.add('active-menu');
</script>