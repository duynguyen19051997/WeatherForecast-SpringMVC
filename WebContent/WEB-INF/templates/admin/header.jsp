<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <!-- Logo -->
                    <div class="logo">
                        <h1><a href="${pageContext.request.contextPath}/admin">VNE-Admin</a></h1>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-lg-12"></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="navbar navbar-inverse" role="banner">
                        <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                	<c:choose>
                                		<c:when test="${not empty inforUser}">
                                			<a href="${pageContext.request.contextPath}/auth/logout" class="dropdown-toggle" data-toggle="dropdown">${inforUser.username}<b class="caret"></b></a>
		                                    <ul class="dropdown-menu animated fadeInUp">
		                                        <li><a href="${pageContext.request.contextPath}/admin/user/profile">Profile</a></li>
		                                        <li><a href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
		                                    </ul>
                                		</c:when>
                                		<c:otherwise>
                                			<a href="${pageContext.request.contextPath}/auth/login">Login</a>
                                		</c:otherwise>
                                	</c:choose>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>