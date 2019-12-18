package duynguyen.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import duynguyen.constant.Defines;
import duynguyen.model.bean.Data;
import duynguyen.model.bean.JsonResult;
import duynguyen.model.dao.DataDAO;
import duynguyen.model.dao.JsonResultDAO;
import duynguyen.model.dao.WeatherDAO;
import duynguyen.util.DateUtil;
import duynguyen.util.StringUtil;

@Controller
public class PublicIndexController {

	@Autowired
	private JsonResultDAO jsonResultDAO;

	@Autowired
	private DataDAO dataDAO;

	@Autowired
	private WeatherDAO weatherDAO;

	private JsonResult jsonResult = null;
	private ArrayList<Data> dataArr = null;
	private List<String> listOfWeek = null;
	private String searchFull = "";
	
	@GetMapping("")
	public String index(ModelMap modelMap) {
		if (dataArr != null) {
			Data today = dataArr.get(0);
			listOfWeek = DateUtil.getDayOfWeek(today.getValid_date());
			for (String string : listOfWeek) {
				System.out.println(string);
			}
		}
		modelMap.addAttribute("search", searchFull);
		modelMap.addAttribute("dataArr", dataArr);
		modelMap.addAttribute("listOfWeek", listOfWeek);
		modelMap.addAttribute("jsonResult", jsonResult);
		return "weatherforecast.public.index";
	}

	@PostMapping("")
	public String index(ModelMap modelMap, @RequestParam("search") String search, RedirectAttributes ra) {
		System.out.println(search);
		searchFull = search;
		modelMap.addAttribute("search", search);
		try {
			URL url = new URL("https://api.weatherbit.io/v2.0/forecast/daily?city=" + StringUtil.splitSpace(search)
					+ "&key=69081231f1834ec58e59bce226192f6d");
			// Parse URL into HttpURLConnection in order to open the connection in order to
			// get the JSON data
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// Set the request to GET or POST as per the requirements
			conn.setRequestMethod("GET");
			// Use the connect method to create the connection bridge
			conn.connect();
			// Get the response status of the Rest API
			int responsecode = conn.getResponseCode();
			System.out.println("Response code is: " + responsecode);

			// Iterating condition to if response code is not 200 then throw a runtime
			// exception
			// else continue the actual process of getting the JSON data
			if (responsecode != 200) {
				conn.disconnect();
				ra.addFlashAttribute("message", Defines.ERROR);
				return "weatherforecast.public.index";
			}

			ObjectMapper mapper = new ObjectMapper(); // just need one
			// Got a Java class that data maps to nicely? If so:
			jsonResult = mapper.readValue(url, JsonResult.class);
			dataArr = jsonResult.getData();

			Data today = dataArr.get(0);

			System.out.println(jsonResult.getCity_name());
			System.out.println(jsonResult.getCountry_code());
			System.out.println(today.getDatetime());

			JsonResult jrObject = jsonResultDAO.hasItem(jsonResult.getCity_name(), jsonResult.getCountry_code(),
					today.getValid_date());

			System.out.println(jrObject instanceof JsonResult);

			listOfWeek = DateUtil.getDayOfWeek(today.getValid_date());
			for (String string : listOfWeek) {
				System.out.println(string);
			}

			if (jrObject instanceof JsonResult) {
				System.out.println(jrObject);
			} else {
				int json_id = jsonResultDAO.addItem(jsonResult);
				int data_id = dataDAO.addItemByJsonId(json_id, today);
				int weather_id = weatherDAO.addItemByDataId(data_id, today.getWeather());
				System.out.println(json_id + "\t" + data_id + "\t" + weather_id);
			}

			modelMap.addAttribute("dataArr", dataArr);
			modelMap.addAttribute("listOfWeek", listOfWeek);
			modelMap.addAttribute("jsonResult", jsonResult);

			// Disconnect the HttpURLConnection stream
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "weatherforecast.public.index";
	}

	@GetMapping("/sixteenday")
	public String idnex1(ModelMap modelMap) {
		modelMap.addAttribute("search", searchFull);
		modelMap.addAttribute("dataArr", dataArr);
		modelMap.addAttribute("jsonResult", jsonResult);
		return "weatherforecast.public.index1";
	}

	@PostMapping("/sixteenday")
	public String index1(ModelMap modelMap, @RequestParam("search") String search, RedirectAttributes ra) {
		System.out.println(search);
		searchFull = search;
		modelMap.addAttribute("search", search);
		try {
			URL url = new URL("https://api.weatherbit.io/v2.0/forecast/daily?city=" + StringUtil.splitSpace(search)
					+ "&key=69081231f1834ec58e59bce226192f6d");
			// Parse URL into HttpURLConnection in order to open the connection in order to
			// get the JSON data
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// Set the request to GET or POST as per the requirements
			conn.setRequestMethod("GET");
			// Use the connect method to create the connection bridge
			conn.connect();
			// Get the response status of the Rest API
			int responsecode = conn.getResponseCode();
			System.out.println("Response code is: " + responsecode);

			// Iterating condition to if response code is not 200 then throw a runtime
			// exception
			// else continue the actual process of getting the JSON data
			if (responsecode != 200) {
				conn.disconnect();
				ra.addFlashAttribute("message", Defines.ERROR);
				return "weatherforecast.public.index";
			}

			ObjectMapper mapper = new ObjectMapper(); // just need one
			// Got a Java class that data maps to nicely? If so:
			jsonResult = mapper.readValue(url, JsonResult.class);
			dataArr = jsonResult.getData();

			Data today = dataArr.get(0);

			System.out.println(jsonResult.getCity_name());
			System.out.println(jsonResult.getCountry_code());
			System.out.println(today.getDatetime());

			JsonResult jrObject = jsonResultDAO.hasItem(jsonResult.getCity_name(), jsonResult.getCountry_code(),
					today.getValid_date());

			System.out.println(jrObject instanceof JsonResult);

			listOfWeek = DateUtil.getDayOfWeek(today.getValid_date());
			for (String string : listOfWeek) {
				System.out.println(string);
			}

			if (jrObject instanceof JsonResult) {
				System.out.println(jrObject);
			} else {
				int json_id = jsonResultDAO.addItem(jsonResult);
				int data_id = dataDAO.addItemByJsonId(json_id, today);
				int weather_id = weatherDAO.addItemByDataId(data_id, today.getWeather());
				System.out.println(json_id + "\t" + data_id + "\t" + weather_id);
			}

			modelMap.addAttribute("dataArr", dataArr);
			modelMap.addAttribute("listOfWeek", listOfWeek);
			modelMap.addAttribute("jsonResult", jsonResult);

			// Disconnect the HttpURLConnection stream
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "weatherforecast.public.index1";
	}

}
