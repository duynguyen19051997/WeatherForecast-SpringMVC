<%@page import="duynguen.model.dao.RoleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thêm thông tin người dùng</div>
             </div>
             <div class="content-box-large box-with-header">
	             	 <c:if test="${not empty msg}">
		    			<h4 class="text-danger">${msg}</h4>
			    	</c:if>
			    	<form:errors path="objUser.*" cssClass="error"></form:errors>
	                 <div>
                 	<form action="" method="post" id="form">
                     <div class="row mb-10"></div>
                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="username">Username</label>
                                 <input name="username" type="text" class="form-control" value="">
                             </div>
                             <div class="form-group">
                                 <label for="fullname">Fullname</label>
                                 <input name="fullname" type="text" class="form-control" value="">
                             </div>
                             <div class="form-group">
                                 <label for="password">Password</label>
                                 <input name="password" type="password" class="form-control" value="">
                             </div>
                             <div class="form-group">
                                 <label for="name">Chức năng</label>
                                 <select name="role_id">
                                 	<c:if test="${not empty listRole}">
	                                 	<c:forEach items="${listRole}" var="objRole">
	                                 		<option value="${objRole.role_id}">${objRole.name}</option>
	                                 	</c:forEach>
                                 	</c:if>
                                 </select>
                             </div>
                         </div>
                         
                     </div>
                     <!-- <hr> -->

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Thêm" class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>
					</form>
                 </div>
             </div>
             <script type="text/javascript">
             	$(document).ready(function(){
             		$('#form').validate({
             			rules:{
             				username:{
             					required: true
             				},
             				fullname:{
             					required: true
             				},
             				password:{
             					required: true
             				},
             			},
             			messages:{
             				username:{
             					required: 'Vui lòng nhập Username'
             				},
             				fullname:{
             					required: 'Vui lòng nhập Fullname'
             				},
             				password:{
             					required: 'Vui lòng nhập Password'
             				},
             			}
             		});
             	});
             </script>
         </div>
     </div>
     <!-- /.row col-size -->
<script>
    document.getElementById("add").classList.add('active-menu');
</script>