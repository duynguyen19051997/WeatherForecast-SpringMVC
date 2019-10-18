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
<div style="height: 600px" class="clearfix content">
	<c:if test="${not empty listLand}">
		<div class="content_title">
	        <h2>${objCat.cname}</h2>
	    </div>
	    <div class="clearfix single_work_container">
	    		<c:set value="${SlugUtil.makeSlug(objCat.cname)}" var="cname"></c:set>
	    		<c:forEach items="${listLand}" var="objLand">
	    			<c:set value="${SlugUtil.makeSlug(objLand.lname)}" var="lname"></c:set>
	    			<div class="clearfix single_work">
			            <img class="img_top" src="${pageContext.request.contextPath}/pathUrl/files/${objLand.picture}" alt="" />
			            <img class="img_bottom" src="${pageContext.request.contextPath}/publicUrl/images/work_bg2.png" alt="" />
			            <a href="${pageContext.request.contextPath}/${cname}/${objLand.cid}/${lname}/${objLand.lid}.html">
			           		<h2>${objLand.lname}</h2>
			            </a>
			            <%-- <a href="${pageContext.request.contextPath}/${cname}/${objLand.cid}/${lname}/${objLand.lid}.html">
			                <p class="caption">${objLand.description}</p>
			            </a> --%>
	        		</div>
	    		</c:forEach>
	      </div>
	      <div class="pagination1">
	      	<c:if test="${numberOfPage > 1}">
			     <nav>
			         <ul class="pagination">
			             <c:set var="disabled" value="disabled"></c:set>
			        	<c:choose>
			        		<c:when test="${currentPage - 1 >= 1}">
			        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/${cname}/${cid}/${currentPage-1}.html" aria-label="Previous"><span aria-hidden="true">Previous</span></a></li>
			        		</c:when>
			        		<c:otherwise>
			        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/${cname}/${cid}/1.html" aria-label="Previous"><span aria-hidden="true">Previous</span></a></li>
			        		</c:otherwise>
			        	</c:choose>
			             <c:forEach begin="1" end="${numberOfPage}" var="i">
			            	<c:choose>
			            		<c:when test="${i eq currentPage}">
			            			<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/${cname}/${cid}/${i}.html">${i}</a></li>
			            		</c:when>
			            		<c:otherwise>
			            			<li><a class="page-link" href="${pageContext.request.contextPath}/${cname}/${cid}/${i}.html">${i}</a></li>
			            		</c:otherwise>
			            	</c:choose>
			            </c:forEach>
			             <c:choose>
			        		<c:when test="${currentPage + 1 <= numberOfPage}">
			        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/${cname}/${cid}/${currentPage+1}.html" aria-label="Next"><span aria-hidden="true">Next</span></a></li>
			        		</c:when>
			        		<c:otherwise>
			        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a class="page-link" href="${pageContext.request.contextPath}/${cname}/${cid}/${numberOfPage}.html" aria-label="Next"><span aria-hidden="true">Next</span></a></li>
			        		</c:otherwise>
			        	</c:choose>
			         </ul>
			     </nav>
			 </c:if>
 			</div>
	   	</c:if>
	   	<c:if test="${empty listLand}">
   			<h3>Không có dữ liệu</h3>
   		</c:if>
   		<script type="text/javascript">
	     	document.getElementById("dropdown").classList.add('active-menu');
	     </script>
	</div>