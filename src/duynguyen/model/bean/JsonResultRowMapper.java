package duynguyen.model.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.RowMapper;

public class JsonResultRowMapper implements RowMapper<JsonResult> {

	@Override
	public JsonResult mapRow(ResultSet rs, int rowNum) throws SQLException {
		JsonResult jr = new JsonResult();
		Data d = new Data();
		Weather w = new Weather();
		ArrayList<Data> dList = new ArrayList<>();

		jr.setJson_id(rs.getInt("json_id"));
		jr.setLat(rs.getDouble("lat"));
		jr.setLon(rs.getDouble("lon"));
		jr.setTimezone(rs.getString("timezone"));
		jr.setCity_name(rs.getString("city_name"));
		jr.setCountry_code(rs.getString("country_code"));
		jr.setState_code(rs.getString("state_code"));

		w.setWeather_id(rs.getInt("weather_id"));
		w.setCode(rs.getInt("code"));
		w.setDescription(rs.getString("description"));
		w.setIcon(rs.getString("icon"));

		d.setData_id(rs.getInt("data_id"));
		d.setValid_date(rs.getTimestamp("valid_date"));
		d.setTs(rs.getInt("ts"));
		d.setDatetime(rs.getTimestamp("datetime"));
		d.setWind_gust_spd(rs.getDouble("wind_gust_spd"));
		d.setWind_spd(rs.getDouble("wind_spd"));
		d.setWind_dir(rs.getInt("wind_dir"));
		d.setWind_cdir(rs.getString("wind_cdir"));
		d.setWind_cdir_full(rs.getString("wind_cdir_full"));
		d.setTemp(rs.getDouble("temp"));
		d.setMax_temp(rs.getDouble("max_temp"));
		d.setMin_temp(rs.getDouble("min_temp"));
		d.setHigh_temp(rs.getDouble("high_temp"));
		d.setLow_temp(rs.getDouble("low_temp"));
		d.setApp_max_temp(rs.getDouble("app_max_temp"));
		d.setApp_min_temp(rs.getDouble("app_min_temp"));
		d.setPop(rs.getDouble("pop"));
		d.setPrecip(rs.getDouble("precip"));
		d.setSnow(rs.getDouble("snow"));
		d.setSnow_depth(rs.getDouble("snow_depth"));
		d.setPres(rs.getDouble("pres"));
		d.setSlp(rs.getDouble("slp"));
		d.setDewpt(rs.getDouble("dewpt"));
		d.setRh(rs.getDouble("rh"));
		d.setClouds_low(rs.getDouble("clouds_low"));
		d.setClouds_mid(rs.getDouble("clouds_mid"));
		d.setClouds_hi(rs.getDouble("clouds_hi"));
		d.setClouds(rs.getDouble("clouds"));
		d.setVis(rs.getDouble("vis"));
		d.setMax_dhi(rs.getDouble("max_dhi"));
		d.setUv(rs.getInt("uv"));
		d.setMoon_phase(rs.getInt("moon_phase"));
		d.setMoonrise_ts(rs.getInt("moonrise_ts"));
		d.setMoonset_ts(rs.getInt("moonset_ts"));
		d.setSunrise_ts(rs.getInt("sunrise_ts"));
		d.setSunset_ts(rs.getInt("sunset_ts"));
		d.setWeather(w);

		dList.add(d);

		jr.setData(dList);

		return jr;
	}

}
