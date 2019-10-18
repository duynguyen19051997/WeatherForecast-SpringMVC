<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa Slide</div>
             </div>
             <div class="content-box-large box-with-header">
                 <div>
                 	<div class="row mb-10"></div>
                     <c:if test="${not empty msg}">
			    		<h4 class="text-danger">${msg}</h4>
			    	</c:if>
					<form id="slideform" action="" method="POST" enctype="multipart/form-data">
						<c:if test="${not empty objSlide}">
	                     <div class="row">
	                         <div class="col-sm-6">
	                             <div class="form-group">
	                                 <label>Slide</label>
	                                 <img width="50px" height="50px" src="${pageContext.request.contextPath}/pathUrl/files/${objSlide.slide}"/>
	                                 <input name="picture" type="file" class="btn btn-default" id="exampleInputFile1">
	                                 <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                             </div>
	
								  <div class="form-group">
	                                 <label for="sort">Sort</label>
	                                 <input name="sort" type="text" class="form-control" value="${objSlide.sort}" placeholder="500">
	                             </div>
	                         </div>
	
	                         <div class="col-sm-6"></div>
	                     </div>
						</c:if>
	                     <hr>
	
	                     <div class="row">
	                         <div class="col-sm-12">
	                             <input type="submit" value="Sửa" class="btn btn-success" />
	                             <input type="reset" value="Nhập lại" class="btn btn-default" />
	                         </div>
	                     </div>
					</form>
                 </div>
             </div>
         </div>
     </div>
     <!-- /.row col-size -->
<script>
    document.getElementById("slide").classList.add('active-menu');
    $(document).ready(function(){
    	$('#slideform').validate({
    		rules:{
    			sort:{
    				required: true,
    				number: true
    			}
    		},
    		messages:{
    			sort:{
    				required: 'Vui lòng không để trống',
    				number: 'Vui lòng nhập đúng số'
    			}
    		}
    	});
    });
</script>