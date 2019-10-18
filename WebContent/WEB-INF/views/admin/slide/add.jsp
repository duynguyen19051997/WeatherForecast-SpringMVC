<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thêm Slide</div>
             </div>
             <div class="content-box-large box-with-header">
                 <div>
                 	<div class="row mb-10"></div>
                     <c:if test="${not empty msg}">
			    		<h4 class="text-danger">${msg}</h4>
			    	</c:if>
					<form id="slideform" action="" method="POST" enctype="multipart/form-data">
	                     <div class="row">
	                         <div class="col-sm-6">
	                             <div class="form-group">
	                                 <label>Slide</label>
	                                 <input name="picture" type="file" class="btn btn-default" id="exampleInputFile1">
	                                 <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                             </div>
	
								  <div class="form-group">
	                                 <label for="sort">Sort</label>
	                                 <input name="sort" type="text" class="form-control" placeholder="500">
	                             </div>
	                         </div>
	
	                         <div class="col-sm-6"></div>
	                     </div>
	
	                     <hr>
	
	                     <div class="row">
	                         <div class="col-sm-12">
	                             <input type="submit" value="Thêm" class="btn btn-success" />
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
    			picture:{
    				required: true
    			},
    			sort:{
    				required: true,
    				number: true
    			}
    		},
    		messages:{
    			picture:{
    				required: 'Vui lòng chọn hình ảnh'
    			},
    			sort:{
    				required: 'Vui lòng không để trống',
    				number: 'Vui lòng nhập đúng số'
    			}
    		}
    	});
    });
</script>