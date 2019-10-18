<%@page import="duynguyen.model.bean.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<div class="clearfix content">
    <div class="contact_us">
    	<c:if test="${not empty msg}">
	    	<h2>${msg}</h2>
    	</c:if>
        <h1>Liên hệ với chúng tôi</h1>
        <p>
            TRUNG TÂM ĐÀO TẠO LẬP TRÌNH VINAENTER EDU<br /> Trụ sở: 154 Phạm Như Xương, Liên Chiểu, Đà Nẵng<br /> Web: <a href="http://vinaenter.edu.vn" title="">www.vinaenter.edu.vn</a>
        </p>
        <form:errors path="objCon.*" cssClass="error"></form:errors>
        <form id="contactform" action="" method="post">
            <p><input type="text" name="fullname" value='<c:if test="${not empty objCon.fullname}">${objCon.fullname}</c:if>' class="wpcf7-text" placeholder="Họ tên *" /></p>
            <p><input type="text" name="email" value='<c:if test="${not empty objCon.email}">${objCon.email}</c:if>' class="wpcf7-email" placeholder="Email *" /></p>
            <p><input type="text" name="subject" value='<c:if test="${not empty objCon.subject}">${objCon.subject}</c:if>' class="wpcf7-text" placeholder="Chủ đề *" /></p>
            <p><textarea class="ckeditor" name="content" placeholder="Nội dung *"><c:if test="${not empty objCon.content}">${objCon.content}</c:if></textarea></p>
            <p><input type="submit" class="wpcf7-submit" value="Gửi liên hệ" /></p>
        </form>
    </div>
    <script type="text/javascript">
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
</div>