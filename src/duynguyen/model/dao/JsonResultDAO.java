package duynguyen.model.dao;

import java.sql.SQLException;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import duynguyen.model.bean.JsonResult;
import duynguyen.model.bean.JsonResultRowMapper;
import duynguyen.util.DateUtil;

@Repository
public class JsonResultDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String ADD_ONE = "INSERT INTO jsonresult(lat, lon, timezone, city_name, country_code, state_code) VALUES (?,?,?,?,?,?)";
	private static final String HAS_ONE = "SELECT j.lat, j.lon, j.timezone, j.city_name, j.country_code, j.state_code, d.*, w.weather_id, w.icon, w.code, w.description FROM jsonresult AS j INNER JOIN data AS d ON d.json_id = j.json_id INNER JOIN weather AS w ON w.data_id = d.data_id"
			+ " WHERE j.city_name = ? AND j.country_code = ? AND d.valid_date BETWEEN ? AND ?";

	public JsonResult hasItem(String city_name, String country_code, Timestamp valid_date) {
		try {
			String start = DateUtil.convertTimestampIntoString(valid_date) + " 00:00:00";
			String end = DateUtil.convertTimestampIntoString(valid_date) + " 23:59:59";
			return jdbcTemplate.queryForObject(HAS_ONE, new Object[] { city_name, country_code, start, end },
					new JsonResultRowMapper());
		} catch (Exception e) {
			return null;
		}
	}

	public int addItem(JsonResult jsonResult) {
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			@Override
			public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection connection)
					throws SQLException {
				PreparedStatement ps = (PreparedStatement) connection.prepareStatement(ADD_ONE,
						Statement.RETURN_GENERATED_KEYS);
				ps.setDouble(1, jsonResult.getLat());
				ps.setDouble(2, jsonResult.getLon());
				ps.setString(3, jsonResult.getTimezone());
				ps.setString(4, jsonResult.getCity_name());
				ps.setString(5, jsonResult.getCountry_code());
				ps.setString(6, jsonResult.getState_code());

				return ps;
			}
		};
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(psc, keyHolder);

		return keyHolder.getKey().intValue();
	}

}
