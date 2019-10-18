<%@page import="duynguyen.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="clearfix content">
	<c:if test="${not empty objLand}">
	    <h1>${objLand.lname} </h1>
	    <div class="clearfix post-meta">
	        <p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${objLand.address}</span> <span><i class="fa fa-folder"></i> Diện tích: 100m2</span></p>
	    </div>
	
	    <div class="vnecontent">
	        <img src="${pageContext.request.contextPath}/pathUrl/files/${objLand.picture}" alt="" />
	        <p>${objLand.detail}</p>
	    </div>
	    <a class="btn" href="">Bài trước</a>
	    <a class="btn" href="">Bài sau</a>
		<%-- <c:if test="${not empty nextLand}">
			<a class="btn" href="${pageContext.request.contextPath}/${SlugUtil.makeSlug(nextLand.cname)}/${nextLand.cid}/${SlugUtil.makeSlug(nextLand.lname)}/${nextLand.lid}.html">Bài kế</a>
		</c:if> --%>
	</c:if>
</div>

<div class="more_themes">
	<c:if test="${not empty listLand}">
	    <h2>Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i></h2>
	    <div class="more_themes_container">
	    	<c:forEach items="${listLand}" var="land">
	    		<div class="single_more_themes floatleft">
		            <img src="${pageContext.request.contextPath}/pathUrl/files/${land.picture}" alt="" />
		            <a href="${pageContext.request.contextPath}/${SlugUtil.makeSlug(land.cname)}/${land.cid}/${SlugUtil.makeSlug(land.lname)}/${land.lid}.html">
		                <h3 id="lienquan">${land.lname}</h3>
		            </a>
		        </div>
	    	</c:forEach>
	        <!-- <div class="single_more_themes floatleft">
	            <img src="http://dummyimage.com/220x150/000/fff&text=Thumbnail" alt="" />
	            <a href="">
	                <h2>Magazine Wp Template</h2>
	            </a>
	        </div>
	        <div class="single_more_themes floatleft">
	            <img src="http://dummyimage.com/220x150/000/fff&text=Thumbnail" alt="" />
	            <a href="">
	                <h2>Magazine Wp Template</h2>
	            </a>
	        </div> -->
	
	    </div>
    </c:if>
    <script type="text/javascript">
     	document.getElementById("dropdown").classList.add('active-menu');
     </script>
</div>