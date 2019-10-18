<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/WEB-INF/templates/taglib.jsp" %>
 <!-- Nav-bar -->
  <ul class="nav">
      <!-- Main menu -->
               <li><a id="trangchu" href="${pageContext.request.contextPath}/admin"><i class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
               <li><a id="cat" href="${pageContext.request.contextPath}/admin/cat/index/1"><i class="glyphicon glyphicon-list"></i>Quản lý Danh mục</a></li>
               <li><a id="land" href="${pageContext.request.contextPath}/admin/land/index/1"><i class="glyphicon glyphicon-book"></i>Quản lý Land</a></li>
               <li><a id="slide" href="${pageContext.request.contextPath}/admin/slide/index"><i class="glyphicon glyphicon-book"></i>Quản lý Slide</a></li>
               <li><a id="contact" href="${pageContext.request.contextPath}/admin/contact/index/1"><i class="glyphicon glyphicon-book"></i>Quản lý Liên hệ</a></li>
               <li><a id="user" href="${pageContext.request.contextPath}/admin/user/index/1"><i class="glyphicon glyphicon-book"></i>Quản lý User</a></li>
               <li><a id="add" href="${pageContext.request.contextPath}/admin/user/add"><i class="glyphicon glyphicon-plus"></i> Thêm User</a></li>
               <li class="submenu">
                   <a href="#">
					   <i class="glyphicon glyphicon-list"></i> Pages
					   <span class="caret pull-right"></span>
					</a>
                   <!-- Sub menu -->
		           <ul>
		           	   <c:choose>
		           	   		<c:when test="${not empty inforUser}">
		           	   			<li><a id="profile" href="${pageContext.request.contextPath}/admin/user/profile">Profile</a></li>
                                <li><a href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
		           	   		</c:when>
		           	   		<c:otherwise>
					             <li><a href="${pageContext.request.contextPath}/auth/login">Login</a></li>
		           	   		</c:otherwise>
		           	   </c:choose>
		           </ul>
     		   </li>
  </ul>
  <!-- /.nav-bar -->