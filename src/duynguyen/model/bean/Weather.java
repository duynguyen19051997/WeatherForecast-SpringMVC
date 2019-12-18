package duynguyen.model.bean;

public class Weather {
	private int weather_id;
	private int data_id;
	private int code;

	private String icon;
	private String description;

	public int getWeather_id() {
		return weather_id;
	}

	public void setWeather_id(int weather_id) {
		this.weather_id = weather_id;
	}

	public int getData_id() {
		return data_id;
	}

	public void setData_id(int data_id) {
		this.data_id = data_id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Weather(int weather_id, int data_id, int code, String icon, String description) {
		super();
		this.weather_id = weather_id;
		this.data_id = data_id;
		this.code = code;
		this.icon = icon;
		this.description = description;
	}

	public Weather() {
		super();
	}

	@Override
	public String toString() {
		return "Weather [weather_id=" + weather_id + ", data_id=" + data_id + ", code=" + code + ", icon=" + icon
				+ ", description=" + description + "]";
	}

}
