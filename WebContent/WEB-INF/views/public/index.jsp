<%@page import="duynguyen.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>

<div class="clearfix slider">
	<c:if test="${not empty listSlide}">
		<div class="w3-content w3-section" style="max-width:690px">
			<c:forEach items="${listSlide}" var="objSlide">
				<img class="mySlides" src="${pageContext.request.contextPath}/pathUrl/files/${objSlide.slide}" style="width:100%">
			</c:forEach>
		<script>
			var myIndex = 0;
			carousel();
			
			function carousel() {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";  
			  }
			  myIndex++;
			  if (myIndex > x.length) {myIndex = 1}    
			  x[myIndex-1].style.display = "block";  
			  setTimeout(carousel, 2000); // Change image every 2 seconds
			}
		</script>
		</div>
	</c:if>
	<c:if test="${empty listSlide}">
		<ul class="pgwSlider">
	         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/megamind_07.jpg" alt="Paris, France" data-description="Eiffel Tower and Champ de Mars" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/megamind_07.jpg" /></li>
	         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/wall-e.jpg" alt="Montréal, QC, Canada" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/wall-e.jpg" data-description="Eiffel Tower and Champ de Mars" /></li>
	         <li>
	             <img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/up-official-trailer-fake.jpg" alt="Shanghai, China" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/up-official-trailer-fake.jpg" data-description="Shanghai ,chaina">
	         </li>
     	</ul>
	</c:if>
</div>


 <div class="clearfix content">
     <div class="content_title">
         <h2>Bài viết mới</h2>
     </div>
     <c:if test="${not empty listLand }">
		<c:forEach items="${listLand}" var="objLand">
			<div class="clearfix single_content">
		         <div class="clearfix post_date floatleft">
		             <div class="date">
		                 <h3>${objLand.cname}</h3>
		                 <p>${objLand.date_create}</p>
		             </div>
		         </div>
		         <div class="clearfix post_detail">
		             <h2><a href="${pageContext.request.contextPath}/${SlugUtil.makeSlug(objLand.cname)}/${objLand.cid}/${SlugUtil.makeSlug(objLand.lname)}/${objLand.lid}.html">${objLand.lname} </a></h2>
		             <div class="clearfix post-meta">
		                 <p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${objLand.address}</span> <span><i class="fa fa-folder"></i> Diện tích: 100m2</span></p>
		             </div>
		             <div class="clearfix post_excerpt">
		                 <img src="${pageContext.request.contextPath}/pathUrl/files/${objLand.picture}" alt="" />
		                 <p>${objLand.description}</p>
		             </div>
		             <a href="${pageContext.request.contextPath}/${SlugUtil.makeSlug(objLand.cname)}/${objLand.cid}/${SlugUtil.makeSlug(objLand.lname)}/${objLand.lid}.html">Đọc thêm</a>
		         </div>
		     </div>
		</c:forEach>
	</c:if>     

 </div>
 
 <div class="pagination1">
     <nav>
         <ul class="pagination">
             <c:set var="disabled" value="disabled"></c:set>
        	<c:choose>
        		<c:when test="${currentPage - 1 >= 1}">
        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/trang-chu/${currentPage -1}.html" aria-label="Previous"><span aria-hidden="true">Previous</span></a></li>
        		</c:when>
        		<c:otherwise>
        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/trang-chu/1.html" aria-label="Previous"><span aria-hidden="true">Previous</span></a></li>
        		</c:otherwise>
        	</c:choose>
             <c:forEach begin="1" end="${numberOfPage}" var="i">
            	<c:choose>
            		<c:when test="${i eq currentPage}">
            			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/trang-chu/${i}.html">${i}</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><a class="page-link" href="${pageContext.request.contextPath}/trang-chu/${i}.html">${i}</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
             <c:choose>
        		<c:when test="${currentPage + 1 <= numberOfPage}">
        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/trang-chu/${currentPage + 1}.html" aria-label="Next"><span aria-hidden="true">Next</span></a></li>
        		</c:when>
        		<c:otherwise>
        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/trang-chu/${numberOfPage}.html" aria-label="Next"><span aria-hidden="true">Next</span></a></li>
        		</c:otherwise>
        	</c:choose>
         </ul>
     </nav>
     <script type="text/javascript">
     	document.getElementById("trangchu").classList.add('active-menu');
     </script>
 </div>