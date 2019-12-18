package duynguyen.model.bean;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonResult {
	private int json_id;

	@JsonProperty
	private double lat;

	@JsonProperty
	private double lon;

	@JsonProperty
	private String timezone;

	@JsonProperty
	private String city_name;

	@JsonProperty
	private String country_code;

	@JsonProperty
	private String state_code;

	@JsonProperty
	private ArrayList<Data> data;

	public int getJson_id() {
		return json_id;
	}

	public void setJson_id(int json_id) {
		this.json_id = json_id;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getTimezone() {
		return timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getCountry_code() {
		return country_code;
	}

	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}

	public String getState_code() {
		return state_code;
	}

	public void setState_code(String state_code) {
		this.state_code = state_code;
	}

	public ArrayList<Data> getData() {
		return data;
	}

	public void setData(ArrayList<Data> data) {
		this.data = data;
	}

	public JsonResult(int json_id, double lat, double lon, String timezone, String city_name, String country_code,
			String state_code, ArrayList<Data> data) {
		super();
		this.json_id = json_id;
		this.lat = lat;
		this.lon = lon;
		this.timezone = timezone;
		this.city_name = city_name;
		this.country_code = country_code;
		this.state_code = state_code;
		this.data = data;
	}

	public JsonResult() {
		super();
	}

	@Override
	public String toString() {
		return "JsonResult [json_id=" + json_id + ", lat=" + lat + ", lon=" + lon + ", timezone=" + timezone
				+ ", city_name=" + city_name + ", country_code=" + country_code + ", state_code=" + state_code
				+ ", data=" + data + "]";
	}

}
