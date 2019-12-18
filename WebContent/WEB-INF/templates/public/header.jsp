<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="container">
	<a href="${pageContext.request.contextPath }/" class="branding"> <img
		src="${pageContext.request.contextPath }/publicUrl/images/logo.png"
		alt="" class="logo">
		<div class="logo-type">
			<h1 class="site-title">Weather Forecast</h1>
		</div>
	</a>

	<!-- Default snippet for navigation -->
	<div class="main-navigation">
		<button type="button" class="menu-toggle">
			<i class="fa fa-bars"></i>
		</button>
		<ul class="menu">
			<li id="now" class="menu-item"><a href="${pageContext.request.contextPath }/">Today</a></li>
			<li id="now-1" class="menu-item"><a href="${pageContext.request.contextPath }/sixteenday">The next 16 days</a></li>
		</ul>
		<!-- .menu -->
	</div>
	<!-- .main-navigation -->

	<div class="mobile-navigation"></div>

</div>