<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa Liên hệ</div>
             </div>
             <div class="content-box-large box-with-header">
	             	 <c:if test="${not empty msg}">
			    		<h4 class="text-danger">${msg}</h4>
			    	</c:if>
			    	<form:errors path="objCon.*" cssClass="error"></form:errors>
	                 <div>
                 	<form id="contactform" action="" method="POST">
                     <div class="row mb-10"></div>
                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="fullname">Họ tên</label>
                                 <input name="fullname" type="text" class="form-control" value='<c:if test="${not empty objCon.fullname}">${objCon.fullname}</c:if>' placeholder="Nhập họ tên">
                             </div>
                             <div class="form-group">
                                 <label for="email">Email</label>
                                 <input name="email" type="text" class="form-control" value='<c:if test="${not empty objCon.email}">${objCon.email}</c:if>' placeholder="Nhập email">
                             </div>
                             <div class="form-group">
                                 <label for="subject">Chủ đề</label>
                                 <input name="subject" type="text" class="form-control" value='<c:if test="${not empty objCon.subject}">${objCon.subject}</c:if>' placeholder="Nhập chủ đề">
                             </div>
                             <div class="form-group">
                                 <label for="content">Nội dung</label>
                                 <textarea name="content" class="ckeditor" rows="3"  placeholder="Nhập nội dung"><c:if test="${not empty objCon.content}">${objCon.content}</c:if></textarea>
                             </div>
                         </div>
                     </div>
                     <!-- <hr> -->

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" name="submit" value="Sửa" class="btn btn-success" />
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
    document.getElementById("contact").classList.add('active-menu');
    $(document).ready(function(){
		$('#contactform').validate({
			ignore: [],
			rules:{
				fullname:{
					required: true
				},
				email:{
					required: true,
					email: true
				},
				subject:{
					required: true
				},
				content:{
					required: true
				}
			},
			messages:{
				fullname:{
					required: 'Vui lòng nhập Họ tên!'
				},
				email:{
					required: 'Vui lòng nhập Email!',
					email: 'Nhập đúng định dạng Email!'
				},
				subject:{
					required: 'Vui lòng nhập Chủ đề!'
				},
				content:{
					required: 'Vui lòng nhập Nội dung'
				}
			}
		})
	});
</script>