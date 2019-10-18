<%@page import="duynguyen.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
 <div class="clearfix slider">
     <ul class="pgwSlider">
         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/megamind_07.jpg" alt="Paris, France" data-description="Eiffel Tower and Champ de Mars" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/megamind_07.jpg" /></li>
         <li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/wall-e.jpg" alt="Montréal, QC, Canada" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/wall-e.jpg" data-description="Eiffel Tower and Champ de Mars" /></li>
         <li>
             <img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/up-official-trailer-fake.jpg" alt="Shanghai, China" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/up-official-trailer-fake.jpg" data-description="Shanghai ,chaina">
         </li>
     </ul>
 </div>

 <div class="clearfix content">
     <div class="content_title">
         <h2>Kết quả tìm kiếm</h2>
     </div>
     <c:choose>
     	<c:when test="${not empty listSearch }">
     		<c:forEach items="${listSearch}" var="objLand">
				<div class="clearfix single_content">
			         <div class="clearfix post_date floatleft">
			             <div class="date">
			                 <h3>${objLand.cname}</h3>
			                 <p>${objLand.date_create}</p>
			             </div>
			         </div>
			         <div class="clearfix post_detail">
			             <h2><a href="">${objLand.lname} </a></h2>
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
     	</c:when>
     	<c:otherwise>
     		<h3>Từ khóa bạn tìm không có</h3>
     	</c:otherwise>
     </c:choose>
 
 </div>
 
 <%-- <div class="pagination">
     <nav>
         <ul>
             <li>
                 <a href="">Previous</a>
             </li>
             <c:forEach begin="1" end="${numberOfPage}" var="i">
            	<c:choose>
            		<c:when test="${i eq currentPage}">
            			<li class="active"><a href="${pageContext.request.contextPath}/trang-chu/${i}.html">${i}</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><a href="${pageContext.request.contextPath}/trang-chu/${i}.html">${i}</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
             <li><a href="">Next</a></li>
         </ul>
     </nav>
 </div> --%>