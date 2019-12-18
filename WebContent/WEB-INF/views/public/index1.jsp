<%@page import="duynguyen.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp"%>
<div class="hero"
	data-bg-image="${pageContext.request.contextPath}/publicUrl/images/featured-image-3.jpg">
	<div class="container">
		<div class="ml-auto">
			<c:if test="${not empty message}">
				<h3 class="text-success">${message}</h3>
			</c:if>
		</div>
		<form id="formsearch" method="post" action="" class="find-location">
			<input id="search"
				value="<c:if test="${not empty search}">${search}</c:if>"
				name="search" type="text" placeholder="Find your location...">
			<input type="submit" value="Find">
		</form>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#formsearch').validate({
					rules : {
						search : {
							required : true
						}
					},
					messages : {
						search : {
							required : 'Not empty, please !'
						}
					},
				});
			});
		</script>
	</div>
</div>
<div class="forecast-table">
	<div class="container">
		<div class="forecast-container">
			<table class="table table-hover">
			    <thead>
			      <tr>
			      	<th>City</th>
			        <th>Time</th>
			        <th>Description</th>
			        <th><img src="${pageContext.request.contextPath}/publicUrl/images/hot.png" title="Temperature (Degree Celcius)" alt=""></th>
			        <th><img src="${pageContext.request.contextPath}/publicUrl/images/humidity.png" title="Humidity" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/uv-protection.png" title="UV-Protection" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/pressure.png" title="Pressure" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/vision.png" title="Visibility" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/wind.png" title="Wind Speed" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/compass.png" title="Wind Direction" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/cloud.png" title="Average total cloud coverage" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/water.png" title="Average sea level pressure" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/snow.png" title="Accumulated snowfall" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/snow-depth.png" title="Snow Depth" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/sunrise.png" title="Sunrise" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/sunset.png" title="Sunset" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/moonrise.png" title="Moonrise" alt=""></th>
			      	<th><img src="${pageContext.request.contextPath}/publicUrl/images/moonset.png" title="Moonset" alt=""></th>
			      </tr>
			    </thead>
			    <tbody>
			      <c:if test="${not empty jsonResult}">
			      	  <c:forEach items="${dataArr}" var="data">
			      	  	 <tr>
					      	<td>${jsonResult.city_name}, ${jsonResult.country_code}</td>
					        <td>${DateUtil.convertTimestampIntoString(data.valid_date)}</td>
					        <td><img src="${pageContext.request.contextPath}/publicUrl/icons/${data.weather.icon}.png" title="${data.weather.description}" width="50px"></td>
					        <td>${data.temp}</td>
					        <td>${data.rh}</td>
					        <td>${data.uv}</td>
					        <td>${Math.ceil(data.pres)}</td>
					        <td>${Math.ceil(data.vis)}</td>
					        <td>${Math.ceil(data.wind_spd)}</td>
					        <td>${data.wind_cdir}</td>
					        <td>${data.clouds}</td>
					        <td>${Math.ceil(data.slp)}</td>
					        <td>${data.snow}</td>
					        <td>${data.snow_depth}</td>
					        <td>${DateUtil.getTime(data.sunrise_ts)}</td>
					        <td>${DateUtil.getTime(data.sunset_ts)}</td>
					        <td>${DateUtil.getTime(data.moonrise_ts)}</td>
					        <td>${DateUtil.getTime(data.moonset_ts)}</td>
					     </tr>
			      	  </c:forEach>
			      </c:if>
			    </tbody>
			  </table>
			<div class="container wf">
				<h2 class="section-title">Notes</h2>
				<div class="row">
					<span class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/humidity.png"
						title="Humidity" alt="">: Average relative humidity (%)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/uv-protection.png"
						title="UV-Protection">: Maximum UV Index (0-11+)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/pressure.png"
						title="Pressure">: Average pressure (mb)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/vision.png"
						title="Vision">: Visibility (default KM)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/wind.png"
						title="Wind Speed">: Wind speed (Default m/s)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/compass.png"
						title="Wind Direction">: Abbreviated wind direction</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/cloud.png"
						title="Average total cloud coverage">: Average total cloud
						coverage (%)</span> <span class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/sunrise.png"
						title="Sunrise">: Sunrise time unix timestamp (UTC)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/water.png"
						title="Average sea level pressure">: Average sea level
						pressure (mb)</span> <span class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/sunset.png"
						title="Sunset">: Sunset time unix timestamp (UTC)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/snow.png"
						title="Accumulated snowfall">: Accumulated snow fall
						(default mm)</span> <span class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/moonrise.png"
						title="Moonrise">: Moonrise time unix timestamp (UTC)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/snow-depth.png"
						title="Snow Depth">: Snow Depth (default mm)</span> <span
						class="col-sm-5"><img
						src="${pageContext.request.contextPath}/publicUrl/images/moonset.png"
						title="Moonset">: Moonset time unix timestamp (UTC)</span>
				</div>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
    document.getElementById("now-1").classList.add('active-menu');
</script>