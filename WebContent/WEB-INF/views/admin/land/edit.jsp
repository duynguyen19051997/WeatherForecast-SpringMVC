<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa Tin</div>
             </div>
             <div class="content-box-large box-with-header">
                 <div>
                     <div class="row mb-10"></div>
                     <c:if test="${not empty msg}">
			    		<h4 class="text-danger">${msg}</h4>
			    	</c:if>
			    	<form:errors path="objLand.*" cssClass="error"></form:errors>
					<form id="landform" action="" method="POST" enctype="multipart/form-data">
						<c:if test="${not empty objLand}">
	                     <div class="row">
	                         <div class="col-sm-6">
	                             <div class="form-group">
	                                 <label for="name">Tên tin</label>
	                                 <input name="lname" type="text" class="form-control" value="${objLand.lname}" placeholder="Nhập tên Land">
	                             </div>
	                             <div class="form-group">
	                                 <label for="area">Area</label>
	                                 <input name="area" type="text" class="form-control" value="${objLand.area}" placeholder="Nhập diện tích">
	                             </div>
	                             <div class="form-group">
	                                 <label for="address">Địa chỉ</label>
	                                 <input name="address" type="text" class="form-control" value="${objLand.address}" placeholder="Nhập địa chỉ">
	                             </div>
	
	                             <div class="form-group">
	                                 <label>Danh mục tin</label>
	                                 <c:if test="${not empty listCat}">
	                               		<select class="form-control" name="cid">
	                               			<c:forEach var="objCat" items="${listCat}">
	                               				  <c:choose>
	                               				  	<c:when test="${objCat.cid == objLand.cid}">
	                               				  		<option value="${objCat.cid}" selected="selected">${objCat.cname }</option>
	                               				  	</c:when>
	                               				  	<c:otherwise>
	                               				  		<option value="${objCat.cid}">${objCat.cname }</option>
	                               				  	</c:otherwise>
	                               				  </c:choose>
	                               			</c:forEach>
	                               		</select>
									 </c:if>
	                             </div>
	
	                             <div class="form-group">
	                                 <label>Thêm hình ảnh</label>
	                                 <input name="avatar" type="file" class="btn btn-default" id="exampleInputFile1">
	                                 <c:if test="${not empty objLand.picture}">
	                                 	<img width="100px" height="100px" alt="Ảnh cũ" src="${pageContext.request.contextPath}/pathUrl/files/${objLand.picture}">
	                                 </c:if>
	                                 <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                             </div>
	
	                             <div class="form-group">
	                                 <label>Mô tả</label>
	                                 <textarea name="description" class="ckeditor" rows="3" placeholder="Nhập mô tả"><c:if test="${not empty objLand.description}">${objLand.description}</c:if></textarea>
	                             </div>
	                             
	                             <div class="form-group">
	                                 <label>Chi tiết</label>
	                                 <textarea name="detail" class="ckeditor" rows="3" placeholder="Nhập chi tiết"><c:if test="${not empty objLand.detail}">${objLand.detail}</c:if></textarea>
	                             </div>
	
	
	                         </div>
	
	                         <div class="col-sm-6"></div>
	                     </div>
	
	                     <hr>
	
	                     <div class="row">
	                         <div class="col-sm-12">
	                             <input type="submit" value="Sửa" class="btn btn-success" />
	                             <input type="reset" value="Nhập lại" class="btn btn-default" />
	                         </div>
	                     </div>
	                    </c:if>
					</form>
                 </div>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->
<script>
    document.getElementById("land").classList.add('active-menu');
    $(document).ready(function(){
		$('#landform').validate({
			ignore: [],
			rules:{
				lname:{
					required: true
				},
				area:{
					required: true,
					number: true
				},
				address:{
					required: true
				},
				description:{
					required: true
				},
				detail:{
					required: true
				}
			},
			messages:{
				lname:{
					required: 'Vui lòng nhập Tên Land!'
				},
				area:{
					required: 'Vui lòng nhập Diện tích',
					number: 'Nhập đúng định dạng số'
				},
				address:{
					required: 'Vui lòng nhập Địa chỉ'
				},
				description:{
					required: 'Vui lòng nhập Mô tả'
				},
				detail:{
					required: 'Vui lòng nhập Chi tiết'
				}
			}
		})
	});
</script>