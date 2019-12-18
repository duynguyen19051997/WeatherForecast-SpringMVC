package duynguyen.model.bean;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Data {
	private int data_id;
	private int json_id;
	private int wind_dir;
	private int uv;
	private int moon_phase;
	private int moonrise_ts;
	private int moonset_ts;
	private int sunrise_ts;
	private int sunset_ts;
	private int ts;

	private Timestamp valid_date;
	private Timestamp datetime;

	private String wind_cdir;
	private String wind_cdir_full;

	private double wind_gust_spd;
	private double wind_spd;
	private double temp;
	private double max_temp;
	private double min_temp;
	private double high_temp;
	private double low_temp;
	private double app_max_temp;
	private double app_min_temp;
	private double pop;
	private double precip;
	private double snow;
	private double snow_depth;
	private double pres;
	private double slp;
	private double dewpt;
	private double rh;
	private double clouds_low;
	private double clouds_mid;
	private double clouds_hi;
	private double clouds;
	private double vis;
	private double max_dhi;

	private Weather weather;

	public int getData_id() {
		return data_id;
	}

	public void setData_id(int data_id) {
		this.data_id = data_id;
	}

	public int getJson_id() {
		return json_id;
	}

	public void setJson_id(int json_id) {
		this.json_id = json_id;
	}

	public int getWind_dir() {
		return wind_dir;
	}

	public void setWind_dir(int wind_dir) {
		this.wind_dir = wind_dir;
	}

	public int getUv() {
		return uv;
	}

	public void setUv(int uv) {
		this.uv = uv;
	}

	public int getMoon_phase() {
		return moon_phase;
	}

	public void setMoon_phase(int moon_phase) {
		this.moon_phase = moon_phase;
	}

	public int getMoonrise_ts() {
		return moonrise_ts;
	}

	public void setMoonrise_ts(int moonrise_ts) {
		this.moonrise_ts = moonrise_ts;
	}

	public int getMoonset_ts() {
		return moonset_ts;
	}

	public void setMoonset_ts(int moonset_ts) {
		this.moonset_ts = moonset_ts;
	}

	public int getSunrise_ts() {
		return sunrise_ts;
	}

	public void setSunrise_ts(int sunrise_ts) {
		this.sunrise_ts = sunrise_ts;
	}

	public int getSunset_ts() {
		return sunset_ts;
	}

	public void setSunset_ts(int sunset_ts) {
		this.sunset_ts = sunset_ts;
	}

	public int getTs() {
		return ts;
	}

	public void setTs(int ts) {
		this.ts = ts;
	}

	public Timestamp getValid_date() {
		return valid_date;
	}

	public void setValid_date(Timestamp valid_date) {
		this.valid_date = valid_date;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getWind_cdir() {
		return wind_cdir;
	}

	public void setWind_cdir(String wind_cdir) {
		this.wind_cdir = wind_cdir;
	}

	public String getWind_cdir_full() {
		return wind_cdir_full;
	}

	public void setWind_cdir_full(String wind_cdir_full) {
		this.wind_cdir_full = wind_cdir_full;
	}

	public double getWind_gust_spd() {
		return wind_gust_spd;
	}

	public void setWind_gust_spd(double wind_gust_spd) {
		this.wind_gust_spd = wind_gust_spd;
	}

	public double getWind_spd() {
		return wind_spd;
	}

	public void setWind_spd(double wind_spd) {
		this.wind_spd = wind_spd;
	}

	public double getTemp() {
		return temp;
	}

	public void setTemp(double temp) {
		this.temp = temp;
	}

	public double getMax_temp() {
		return max_temp;
	}

	public void setMax_temp(double max_temp) {
		this.max_temp = max_temp;
	}

	public double getMin_temp() {
		return min_temp;
	}

	public void setMin_temp(double min_temp) {
		this.min_temp = min_temp;
	}

	public double getHigh_temp() {
		return high_temp;
	}

	public void setHigh_temp(double high_temp) {
		this.high_temp = high_temp;
	}

	public double getLow_temp() {
		return low_temp;
	}

	public void setLow_temp(double low_temp) {
		this.low_temp = low_temp;
	}

	public double getApp_max_temp() {
		return app_max_temp;
	}

	public void setApp_max_temp(double app_max_temp) {
		this.app_max_temp = app_max_temp;
	}

	public double getApp_min_temp() {
		return app_min_temp;
	}

	public void setApp_min_temp(double app_min_temp) {
		this.app_min_temp = app_min_temp;
	}

	public double getPop() {
		return pop;
	}

	public void setPop(double pop) {
		this.pop = pop;
	}

	public double getPrecip() {
		return precip;
	}

	public void setPrecip(double precip) {
		this.precip = precip;
	}

	public double getSnow() {
		return snow;
	}

	public void setSnow(double snow) {
		this.snow = snow;
	}

	public double getSnow_depth() {
		return snow_depth;
	}

	public void setSnow_depth(double snow_depth) {
		this.snow_depth = snow_depth;
	}

	public double getPres() {
		return pres;
	}

	public void setPres(double pres) {
		this.pres = pres;
	}

	public double getSlp() {
		return slp;
	}

	public void setSlp(double slp) {
		this.slp = slp;
	}

	public double getDewpt() {
		return dewpt;
	}

	public void setDewpt(double dewpt) {
		this.dewpt = dewpt;
	}

	public double getRh() {
		return rh;
	}

	public void setRh(double rh) {
		this.rh = rh;
	}

	public double getClouds_low() {
		return clouds_low;
	}

	public void setClouds_low(double clouds_low) {
		this.clouds_low = clouds_low;
	}

	public double getClouds_mid() {
		return clouds_mid;
	}

	public void setClouds_mid(double clouds_mid) {
		this.clouds_mid = clouds_mid;
	}

	public double getClouds_hi() {
		return clouds_hi;
	}

	public void setClouds_hi(double clouds_hi) {
		this.clouds_hi = clouds_hi;
	}

	public double getClouds() {
		return clouds;
	}

	public void setClouds(double clouds) {
		this.clouds = clouds;
	}

	public double getVis() {
		return vis;
	}

	public void setVis(double vis) {
		this.vis = vis;
	}

	public double getMax_dhi() {
		return max_dhi;
	}

	public void setMax_dhi(double max_dhi) {
		this.max_dhi = max_dhi;
	}

	public Weather getWeather() {
		return weather;
	}

	public void setWeather(Weather weather) {
		this.weather = weather;
	}

	public Data(int data_id, int json_id, int wind_dir, int uv, int moon_phase, int moonrise_ts, int moonset_ts,
			int sunrise_ts, int sunset_ts, int ts, Timestamp valid_date, Timestamp datetime, String wind_cdir,
			String wind_cdir_full, double wind_gust_spd, double wind_spd, double temp, double max_temp, double min_temp,
			double high_temp, double low_temp, double app_max_temp, double app_min_temp, double pop, double precip,
			double snow, double snow_depth, double pres, double slp, double dewpt, double rh, double clouds_low,
			double clouds_mid, double clouds_hi, double clouds, double vis, double max_dhi, Weather weather) {
		super();
		this.data_id = data_id;
		this.json_id = json_id;
		this.wind_dir = wind_dir;
		this.uv = uv;
		this.moon_phase = moon_phase;
		this.moonrise_ts = moonrise_ts;
		this.moonset_ts = moonset_ts;
		this.sunrise_ts = sunrise_ts;
		this.sunset_ts = sunset_ts;
		this.ts = ts;
		this.valid_date = valid_date;
		this.datetime = datetime;
		this.wind_cdir = wind_cdir;
		this.wind_cdir_full = wind_cdir_full;
		this.wind_gust_spd = wind_gust_spd;
		this.wind_spd = wind_spd;
		this.temp = temp;
		this.max_temp = max_temp;
		this.min_temp = min_temp;
		this.high_temp = high_temp;
		this.low_temp = low_temp;
		this.app_max_temp = app_max_temp;
		this.app_min_temp = app_min_temp;
		this.pop = pop;
		this.precip = precip;
		this.snow = snow;
		this.snow_depth = snow_depth;
		this.pres = pres;
		this.slp = slp;
		this.dewpt = dewpt;
		this.rh = rh;
		this.clouds_low = clouds_low;
		this.clouds_mid = clouds_mid;
		this.clouds_hi = clouds_hi;
		this.clouds = clouds;
		this.vis = vis;
		this.max_dhi = max_dhi;
		this.weather = weather;
	}

	public Data() {
		super();
	}

	@Override
	public String toString() {
		return "Data [data_id=" + data_id + ", json_id=" + json_id + ", wind_dir=" + wind_dir + ", uv=" + uv
				+ ", moon_phase=" + moon_phase + ", moonrise_ts=" + moonrise_ts + ", moonset_ts=" + moonset_ts
				+ ", sunrise_ts=" + sunrise_ts + ", sunset_ts=" + sunset_ts + ", ts=" + ts + ", valid_date="
				+ valid_date + ", datetime=" + datetime + ", wind_cdir=" + wind_cdir + ", wind_cdir_full="
				+ wind_cdir_full + ", wind_gust_spd=" + wind_gust_spd + ", wind_spd=" + wind_spd + ", temp=" + temp
				+ ", max_temp=" + max_temp + ", min_temp=" + min_temp + ", high_temp=" + high_temp + ", low_temp="
				+ low_temp + ", app_max_temp=" + app_max_temp + ", app_min_temp=" + app_min_temp + ", pop=" + pop
				+ ", precip=" + precip + ", snow=" + snow + ", snow_depth=" + snow_depth + ", pres=" + pres + ", slp="
				+ slp + ", dewpt=" + dewpt + ", rh=" + rh + ", clouds_low=" + clouds_low + ", clouds_mid=" + clouds_mid
				+ ", clouds_hi=" + clouds_hi + ", clouds=" + clouds + ", vis=" + vis + ", max_dhi=" + max_dhi
				+ ", weather=" + weather + "]";
	}

}
