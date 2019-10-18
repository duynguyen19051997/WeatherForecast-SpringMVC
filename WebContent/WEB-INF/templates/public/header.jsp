<%@page import="duynguyen.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
 <section id="header_area">
        <div class="wrapper header">
            <div class="clearfix header_top">
                <div class="clearfix logo floatleft">
                    <a href="${pageContext.request.contextPath}/trang-chu/1.html">
                        <h1><span>C</span>Land</h1>
                    </a>
                </div>
                <div class="clearfix search floatright">
                    <form id="search" action="${pageContext.request.contextPath}/search.html" method="GET">
                        <input type="text" name="search" value='<c:if test="${not empty search}">${search}</c:if>' placeholder="Search" />
                        <input type="submit" name="submit"/>
                    </form>
                    <script type="text/javascript">
	        $(document).ready(function () {
	    		$('#search').validate({
	    			rules: {
	    				"search": {
	    					required: true,
	    				},
	    			},
	    			messages: {
	    			  "search": {
	    				required: "Vui lòng không để trống!",
	    			  },
	    			},
	    		});
	    	});	
       	</script>
                </div>
            </div>
            <div class="header_bottom">
                <nav>
                    <ul id="nav">
                        <li><a id="trangchu" href="${pageContext.request.contextPath}/trang-chu/1.html">Trang chủ</a></li>
                        <c:if test="${not empty listCat}">
	                        <li id="dropdown"><a href="javascript: void(0);">Bất động sản</a>
	                            <ul>
	                            	<c:forEach items="${listCat}" var="objCat">
	                            		<c:set value="${SlugUtil.makeSlug(objCat.cname)}" var="urlCat"></c:set>
	                                	<li><a href="${pageContext.request.contextPath}/${urlCat}/${objCat.cid}/1.html">${objCat.cname}</a></li>
	                                </c:forEach>
	                            </ul>
	                        </li>
                        </c:if>
                        <li><a id="contact" href="${pageContext.request.contextPath}/contact.html">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>