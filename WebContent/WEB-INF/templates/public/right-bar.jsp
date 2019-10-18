<%@page import="duynguen.model.dao.LandDao"%>
<%@page import="duynguyen.interceptor.ListCategoryInterceptor"%>
<%@page import="duynguyen.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="clearfix sidebar">
    <div class="clearfix single_sidebar category_items">
        <h2>Danh mục bất động sản</h2>
        <c:if test="${not empty listCat}">
        	<ul>
        		<c:forEach items="${listCat}" var="objCat">
        			<c:set value="${SlugUtil.makeSlug(objCat.cname)}" var="urlCat"></c:set>
        			<li class="cat-item"><a href="${pageContext.request.contextPath}/${urlCat}/${objCat.cid}/1.html">${objCat.cname}</a>(${landDao.totalLanByCid(objCat.cid)})</li>
        		</c:forEach>
	        </ul>
        </c:if>
    </div>

    <div class="clearfix single_sidebar">
        <div class="popular_post">
            <div class="sidebar_title">
                <h2>Xem nhiều</h2>
            </div>
            <!-- <ul> -->
            	<c:if test="${not empty listCountViews}">
		        	<ul>
		        		<c:forEach items="${listCountViews}" var="list">
		        			<li><a href="${pageContext.request.contextPath}/${SlugUtil.makeSlug(list.cname)}/${list.cid}/${SlugUtil.makeSlug(list.lname)}/${list.lid}.html">${list.lname}</a></li>
		        		</c:forEach>
			        </ul>
		        </c:if>
        </div>
    </div>

    <div class="clearfix single_sidebar">
    	<c:if test="${not empty listCatSort}">
	        <h2>Danh mục hot</h2>
	        <ul>
	        	<c:forEach items="${listCatSort}" var="objList">
	        		<c:set value="${SlugUtil.makeSlug(objList.cname)}" var="urlCat"></c:set>
        			<li class="cat-item"><a href="${pageContext.request.contextPath}/${urlCat}/${objList.cid}/1.html">${objList.cname}</a>(${objList.total})</li>
	        	</c:forEach>
	        </ul>
        </c:if>
    </div>
</div>
