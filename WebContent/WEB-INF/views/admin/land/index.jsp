<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <c:choose>
        	<c:when test="${objCat ne null}">
        		<div class="panel-title ">Quản lý tin thuộc danh mục: ${objCat.cname} </div>
        	</c:when>
        	<c:otherwise>
        		<div class="panel-title ">Quản lý tin </div>
        	</c:otherwise>
        </c:choose>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/land/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

    </div>
    <div class="col-md-4">
        <form id="search" action="${pageContext.request.contextPath}/admin/land/search" method="get">
        	<div class="input-group form">
	            <input type="text" name="search" class="form-control" value='<c:if test="${not empty search}">${search}</c:if>' placeholder="Search...">
	            <span class="input-group-btn">
	     			<button class="btn btn-primary" type="submit">Search</button>
	   			</span>
        	</div>
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

<div class="row">
    <div class="panel-body">
    	<c:if test="${not empty msg}">
    		<h4 class="text-danger">${msg}</h4>
    	</c:if>
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th>ID</th>
                    <th width="400px">Tên</th>
                    <th>Danh mục</th>
                    <th>Lượt đọc</th>
                    <th>Hình ảnh</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty listLand}">
            		<c:forEach items="${listLand}" var="objLand">
            			<c:set value="${pageContext.request.contextPath}/admin/land/edit/${objLand.lid}/${currentPage}" var="urlEdit"></c:set>
            			<c:set value="${pageContext.request.contextPath}/admin/land/delete/${objLand.lid}" var="urlDelete"></c:set>
            			<tr class="odd gradeX">
		                    <td>${objLand.lid}</td>
		                    <td>${objLand.lname}</td>
		                    <td>${objLand.cname}</td>
		                    <td class="center"> ${objLand.count_views}</td>
		                    <td class="center text-center">
		                    	<c:if test="${not empty objLand.picture}">
		                    		<img width="50px" height="50px" src="${pageContext.request.contextPath}/pathUrl/files/${objLand.picture}"/>
		                    	</c:if>
		                    </td>
		                    <td class="center text-center">
		                        <a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                        <a onclick="return confirm('Bạn có chắc chắn muốn xóa không ?')" href="${urlDelete}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                    </td>
		                </tr>
            		</c:forEach>
            	</c:if>
                <c:if test="${empty listLand}">
                	<tr>
                		<td colspan="6" style="text-align: center;">Không có dữ liệu</td>
                	</tr>
                </c:if>
            </tbody>
        </table>
    <c:choose>
    	<c:when test="${objCat ne null}">
    		<c:if test="${numberOfPage > 1}">
		        <!-- Pagination -->
		    <nav class="text-center" aria-label="...">
		        <ul class="pagination">
		        	<c:set var="disabled" value="disabled"></c:set>
		        	<c:choose>
		        		<c:when test="${currentPage - 1 >= 1}">
		        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/${objCat.cid}/index/${currentPage -1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		        		</c:when>
		        		<c:otherwise>
		        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/${objCat.cid}/index/1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		        		</c:otherwise>
		        	</c:choose>
		             <c:forEach begin="1" end="${numberOfPage}" var="i">
		            	<c:choose>
		            		<c:when test="${i eq currentPage}">
		            			<li class="active"><a href="${pageContext.request.contextPath}/admin/land/${objCat.cid}/index/${i}">${i}</a></li>
		            		</c:when>
		            		<c:otherwise>
		            			<li><a href="${pageContext.request.contextPath}/admin/land/${objCat.cid}/index/${i}">${i}</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		            <c:choose>
		        		<c:when test="${currentPage + 1 <= numberOfPage}">
		        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/${objCat.cid}/index/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		        		</c:when>
		        		<c:otherwise>
		        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/${objCat.cid}/index/${numberOfPage}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		        		</c:otherwise>
		        	</c:choose>
		        </ul>
		    </nav>
		    <!-- /.pagination -->
		    </c:if>
    	</c:when>
    	<c:otherwise>
    		<c:if test="${numberOfPage > 1}">
		        <!-- Pagination -->
		    <nav class="text-center" aria-label="...">
		        <ul class="pagination">
		        	<c:set var="disabled" value="disabled"></c:set>
		        	<c:choose>
		        		<c:when test="${currentPage - 1 >= 1}">
		        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/index/${currentPage -1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		        		</c:when>
		        		<c:otherwise>
		        			<li class='<c:if test="${currentPage == 1}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/index/1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		        		</c:otherwise>
		        	</c:choose>
		             <c:forEach begin="1" end="${numberOfPage}" var="i">
		            	<c:choose>
		            		<c:when test="${i eq currentPage}">
		            			<li class="active"><a href="${pageContext.request.contextPath}/admin/land/index/${i}">${i}</a></li>
		            		</c:when>
		            		<c:otherwise>
		            			<li><a href="${pageContext.request.contextPath}/admin/land/index/${i}">${i}</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		            <c:choose>
		        		<c:when test="${currentPage + 1 <= numberOfPage}">
		        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/index/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		        		</c:when>
		        		<c:otherwise>
		        			<li class='<c:if test="${currentPage == numberOfPage}">${disabled}</c:if>'><a href="${pageContext.request.contextPath}/admin/land/index/${numberOfPage}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		        		</c:otherwise>
		        	</c:choose>
		        </ul>
		    </nav>
		    <!-- /.pagination -->
		    </c:if>
    	</c:otherwise>
    </c:choose>

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->
<script>
    document.getElementById("land").classList.add('active-menu');
</script>