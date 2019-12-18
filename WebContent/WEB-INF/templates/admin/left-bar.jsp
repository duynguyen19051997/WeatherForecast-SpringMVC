<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<!-- Sidebar scroll-->
<div class="scroll-sidebar">
	<!-- Sidebar navigation-->
	<nav class="sidebar-nav">
		<ul id="sidebarnav" class="p-t-30">
			<li id="index" class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link"
				href="${pageContext.request.contextPath}/admin" aria-expanded="false"> <i
					class="fas fa-warehouse"></i><span class="hide-menu">Admin's Homepage</span>
			</a></li>

			<li id="cat" class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/cat/index/1"
				aria-expanded="false"> <i class="fas fa-align-justify"></i><span
					class="hide-menu">Categories Management</span>
			</a></li>

			<li id="book" class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/book/index/1"
				aria-expanded="false"> <i class="fas fa-book"></i><span
					class="hide-menu">Products Management</span>
			</a></li>
			
			<c:if test="${'ADMIN' eq inforUser.name || 'MOD' eq inforUser.name}">
				<li id="bill" class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/bill/index/1"
					aria-expanded="false"> <i class="fas fa-shopping-cart"></i><span
						class="hide-menu">Bills Management</span>
				</a></li>
				
				<li id="money" class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/total/index"
					aria-expanded="false"> <i class="far fa-money-bill-alt"></i><span
						class="hide-menu">Total Income</span>
				</a></li>
			</c:if>
			
			<li id="slide" class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/slide/index/1"
				aria-expanded="false"> <i class="fab fa-slideshare"></i><span
					class="hide-menu">Slides Management</span>
			</a></li>
			
			<li id="comment" class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/comment/index/1"
				aria-expanded="false"> <i class="fas fa-comments"></i><span
					class="hide-menu">Comments Management</span>
			</a></li>

			<li id="user" class="sidebar-item"><a
				class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath}/admin/user/index/1"
				aria-expanded="false"><i class="fas fa-users"></i><span
					class="hide-menu">Users Management</span>
			</a></li>

		</ul>
	</nav>
	<!-- End Sidebar navigation -->
</div>
<!-- End Sidebar scroll-->