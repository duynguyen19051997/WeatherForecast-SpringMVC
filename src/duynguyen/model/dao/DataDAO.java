package duynguyen.model.dao;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import duynguyen.model.bean.Data;

@Repository
public class DataDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String ADD_ONE_BY_JSON_ID = "INSERT INTO data(json_id, valid_date, ts, datetime, wind_gust_spd, wind_spd, wind_dir, "
			+ "wind_cdir, wind_cdir_full, temp, max_temp, min_temp, high_temp, low_temp, app_max_temp, app_min_temp, "
			+ "pop, precip, snow, snow_depth, pres, slp, dewpt, rh, clouds_low, clouds_mid, clouds_hi, clouds, vis, max_dhi, uv, moon_phase, moonrise_ts, "
			+ "moonset_ts, sunrise_ts, sunset_ts) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	public int addItemByJsonId(int json_id, Data data) {
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			@Override
			public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection connection)
					throws SQLException {
				PreparedStatement ps = (PreparedStatement) connection.prepareStatement(ADD_ONE_BY_JSON_ID,
						Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, json_id);
				ps.setTimestamp(2, data.getValid_date());
				ps.setInt(3, data.getTs());
				ps.setTimestamp(4, data.getDatetime());
				ps.setDouble(5, data.getWind_gust_spd());
				ps.setDouble(6, data.getWind_spd());
				ps.setInt(7, data.getWind_dir());
				ps.setString(8, data.getWind_cdir());
				ps.setString(9, data.getWind_cdir_full());
				ps.setDouble(10, data.getTemp());
				ps.setDouble(11, data.getMax_temp());
				ps.setDouble(12, data.getMin_temp());
				ps.setDouble(13, data.getHigh_temp());
				ps.setDouble(14, data.getLow_temp());
				ps.setDouble(15, data.getApp_max_temp());
				ps.setDouble(16, data.getApp_min_temp());
				ps.setDouble(17, data.getPop());
				ps.setDouble(18, data.getPrecip());
				ps.setDouble(19, data.getSnow());
				ps.setDouble(20, data.getSnow_depth());
				ps.setDouble(21, data.getPres());
				ps.setDouble(22, data.getSlp());
				ps.setDouble(23, data.getDewpt());
				ps.setDouble(24, data.getRh());
				ps.setDouble(25, data.getClouds_low());
				ps.setDouble(26, data.getClouds_mid());
				ps.setDouble(27, data.getClouds_hi());
				ps.setDouble(28, data.getClouds());
				ps.setDouble(29, data.getVis());
				ps.setDouble(30, data.getMax_dhi());
				ps.setInt(31, data.getUv());
				ps.setInt(32, data.getMoon_phase());
				ps.setInt(33, data.getMoonrise_ts());
				ps.setInt(34, data.getMoonset_ts());
				ps.setInt(35, data.getSunrise_ts());
				ps.setInt(36, data.getSunset_ts());

				return ps;
			}
		};
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(psc, keyHolder);

		return keyHolder.getKey().intValue();
	}
}
