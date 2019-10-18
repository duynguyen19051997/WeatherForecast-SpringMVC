<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa thông tin người dùng</div>
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
                                <input name="username" type="text" class="form-control" value='<c:if test="${not empty objUser}">${objUser.username}</c:if>' readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="fullname">Fullname</label>
                                <input name="fullname" type="text" class="form-control" value='<c:if test="${not empty objUser}">${objUser.fullname}</c:if>'>
                            </div>
                            <c:if test="${inforUser.id == 5}">
                            	<div class="form-group">
                                 <label for="enable">Enable</label>
                                 <c:choose>
                                 	<c:when test="${objUser.enable == 1}">
                                 		<input name="enable" type="radio"  value="1" checked="checked"> Active
                                 		<input name="enable" type="radio" value="0"> No Active
                                 	</c:when>
                                 	<c:otherwise>
                                 		<input name="enable" type="radio"  value="1"> Active
                                 		<input name="enable" type="radio" value="0" checked="checked"> No Active
                                 	</c:otherwise>
                                 </c:choose>
                             </div>
                             <div class="form-group">
                                 <label for="name">Chức năng</label>
                                 <select name="role_id">
                                 	<c:if test="${not empty listRole}">
	                                 	<c:forEach items="${listRole }" var="objRole">
	                                 		<c:choose>
	                                 			<c:when test="${objRole.role_id == objUser.role_id}">
	                                 				<option value="${objRole.role_id}" selected="selected">${objRole.name}</option>
	                                 			</c:when>
	                                 			<c:otherwise>
	                                 				<option value="${objRole.role_id}">${objRole.name}</option>
	                                 			</c:otherwise>
	                                 		</c:choose>
	                                 	</c:forEach>
                                 	</c:if>
                                 </select>
                             </div>
                            </c:if>
                        </div>
                    </div>
                    <!-- <hr> -->

                    <div class="row">
                        <div class="col-sm-12">
                            <input type="submit" value="Sửa" class="btn btn-success" />
                            <input type="reset" value="Nhập lại" class="btn btn-default" />
                        </div>
                    </div>
                 </div>
             </div>
             <script type="text/javascript">
             	$(document).ready(function(){
             		$('#form').validate({
             			rules:{
             				fullname:{
             					required: true
             				},
             				password:{
             					required: true
             				}
             			},
             			messages:{
             				fullname:{
             					required: 'Vui lòng nhập Fullname'
             				},
             				password:{
             					required: 'Vui lòng nhập Password'
             				}
             			}
             		});
             	});
             </script>
         </div>
     </div>
     <!-- /.row col-size -->
<script>
    document.getElementById("user").classList.add('active-menu');
</script>