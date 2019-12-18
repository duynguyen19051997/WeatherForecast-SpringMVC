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
			<c:if test="${not empty listOfWeek}">
				<ul class="nav nav-tabs week">
					<% int num = 0; %>
					<c:forEach items="${listOfWeek}" var="dayObj">
						<li class="active tab-week week-day">
							<a data-toggle="tab" href="#day-<%=num++%>">${dayObj}</a>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<div class="tab-content">
				<c:if test="${not empty jsonResult}">
					<% int num = 0; %>
					<c:forEach items="${dataArr}" var="data">
						<div id="day-<%=num%>" class='today forecast tab-pane <%if(num==0){%>active<%}%>'>
							<div class="forecast-header">
								<div class="city">${jsonResult.city_name}, ${jsonResult.country_code}</div>
								<div class="day">
									${data.weather.description}
								</div>
								<div class="date">${DateUtil.convertTimestampIntoString(data.valid_date)}</div>
							</div>
							<!-- .forecast-header -->
							<div class="forecast-content">
								<div class="location">${data.weather.description}</div>
								<div class="degree">
									<div class="num">
										${data.temp}<sup>o</sup>C
									</div>
									<div class="forecast-icon">
										<img
											src="${pageContext.request.contextPath}/publicUrl/icons/${data.weather.icon}.png"
											alt="" title="${data.weather.description}" width="90px">
									</div>
								</div>
								<div class="degree row">
									<span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/humidity.png"
										title="Humidity" alt="">${data.rh}%</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/uv-protection.png"
										title="UV-Protection">${data.uv}</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/pressure.png"
										title="Pressure">${Math.ceil(data.pres)}mb</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/vision.png"
										title="Visibility ">${Math.ceil(data.vis)}km</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/wind.png"
										title="Wind Speed">${Math.ceil(data.wind_spd)}m/s</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/compass.png"
										title="Wind Direction">${data.wind_cdir_full}</span>
								</div>
								<div class="degree row">
									<span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/cloud.png"
										title="Average total cloud coverage">${data.clouds}%</span> <span
										class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/sunrise.png"
										title="Sunrise">${DateUtil.getTime(data.sunrise_ts)}</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/water.png"
										title="Average sea level pressure">${Math.ceil(data.slp)}mb</span> <span
										class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/sunset.png"
										title="Sunset">${DateUtil.getTime(data.sunset_ts)}</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/snow.png"
										title="Accumulated snowfall">${data.snow}mm</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/moonrise.png"
										title="Moonrise">${DateUtil.getTime(data.moonrise_ts)}</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/snow-depth.png"
										title="Snow Depth">${data.snow_depth}mm</span> <span class="col-sm-5"><img
										src="${pageContext.request.contextPath}/publicUrl/images/moonset.png"
										title="Moonset">${DateUtil.getTime(data.moonset_ts)}</span>
								</div>
								<div class="clear"></div>
								<div class="location row">
									<span class="col-sm-5">Minimum Temperature: ${Math.ceil(data.min_temp)}<sup>o</sup>C
									</span> <span class="col-sm-5">Low-level (~0-3km AGL) cloud
										coverage: ${Math.ceil(data.clouds_low)}%</span> <span class="col-sm-5">Maximum Temperature:
										${Math.ceil(data.max_temp)}<sup>o</sup>C
									</span> <span class="col-sm-5">High-level (>5km AGL) cloud
										coverage: ${Math.ceil(data.clouds_hi)}%</span> <span class="col-sm-5">"Feels Like"
										temperature at min_temp time: ${Math.ceil(data.app_min_temp)}<sup>o</sup>C
									</span> <span class="col-sm-5">Accumulated snow fall: ${data.snow}mm</span> <span
										class="col-sm-5">"Feels Like" temperature at max_temp
										time: ${Math.ceil(data.app_max_temp)}<sup>o</sup>C
									</span> <span class="col-sm-5">Accumulated liquid equivalent
										precipitation: ${data.snow_depth}mm</span>
								</div>
							</div>
						</div>
						<% 
							num++;
							if (num == 8) {
								break;
							}
						%>
					</c:forEach>
				</c:if>
				
			</div>
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
    document.getElementById("now").classList.add('active-menu');
</script>