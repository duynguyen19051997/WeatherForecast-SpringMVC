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

import duynguyen.model.bean.Weather;

@Repository
public class WeatherDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String ADD_ONE_BY_DATA_ID = "INSERT INTO weather(data_id, icon, code, description) "
			+ "VALUES (?,?,?,?)";

	public int addItemByDataId(int data_id, Weather weather) {
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			@Override
			public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection connection)
					throws SQLException {
				PreparedStatement ps = (PreparedStatement) connection.prepareStatement(ADD_ONE_BY_DATA_ID,
						Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, data_id);
				ps.setString(2, weather.getIcon());
				ps.setInt(3, weather.getCode());
				ps.setString(4, weather.getDescription());

				return ps;
			}
		};
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(psc, keyHolder);

		return keyHolder.getKey().intValue();
	}
}
