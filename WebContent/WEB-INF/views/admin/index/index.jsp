<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
    <div class="col-md-6">
        <div class="content-box-large">
            <div class="panel-heading">
                <div class="panel-title">Chào mừng đến với trang quản trị</div>
                <div class="panel-options">
                    <a href="${pageContext.request.contextPath}/admin" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
 <div class="row">
    <div class="col-md-12 panel-warning">
        <div class="content-box-header panel-heading">
            <div class="panel-title ">Menu</div>
        </div>
        <div class="content-box-large box-with-header">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-green set-icon">
        <span class="glyphicon glyphicon-th-list"></span>
                        </span>
                        <div class="text-box">
                            <p class="main-text"><a class="fs-14" href="${pageContext.request.contextPath}/admin/cat/index/1" title="">Quản lý Danh Mục</a></p>
                            <p class="text-muted">Có <c:if test="${not empty totalCat}">${totalCat}</c:if> Danh Mục</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-blue set-icon">
        <span class="glyphicon glyphicon-book"></span>
                        </span>
                        <div class="text-box">
                            <p class="main-text"><a class="fs-14" href="${pageContext.request.contextPath}/admin/land/index/1" title="">Quản lý Land</a></p>
                            <p class="text-muted">Có <c:if test="${not empty totalLand}">${totalLand}</c:if> Land</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-brown set-icon">
        <span class="glyphicon glyphicon-user"></span>
                        </span>
                        <div class="text-box">
                            <p class="main-text"><a class="fs-14" href="${pageContext.request.contextPath}/admin/contact/index/1" title="">Quản lý Liên hệ</a></p>
                            <p class="text-muted">Có <c:if test="${not empty totalContact}">${totalContact}</c:if> Liên hệ</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-blue set-icon">
        <span class="glyphicon glyphicon-book"></span>
                        </span>
                        <div class="text-box">
                            <p class="main-text"><a class="fs-14" href="${pageContext.request.contextPath}/admin/slide/index" title="">Quản lý Slide</a></p>
                            <p class="text-muted">Có <c:if test="${not empty totalSlide}">${totalSlide}</c:if> Slide</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-brown set-icon">
        <span class="glyphicon glyphicon-user"></span>
                        </span>
                        <div class="text-box">
                            <p class="main-text"><a class="fs-14" href="${pageContext.request.contextPath}/admin/user/index/1" title="">Quản lý User</a></p>
                            <p class="text-muted">Có <c:if test="${not empty totalUser}">${totalUser}</c:if> User</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("trangchu").classList.add('active-menu');
</script>