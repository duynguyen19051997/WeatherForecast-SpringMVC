package vn.edu.vinaenter.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.model.bean.Land;

@Repository
public class LandDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FIND_ALL = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid ORDER BY lid DESC";
	private static final String INSERT_SQL = "INSERT INTO lands(lname, description, detail, cid, picture, area, address) VALUES(?,?,?,?,?,?,?)";
	private static final String FIND_ONE_BY_LID = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lid = ?";
	private static final String UPDATE_ONE = "UPDATE lands SET lname = ?, description = ?, detail = ?, cid = ?, picture = ?, area = ?, address = ? WHERE lid = ?";
	private static final String DELETE_ONE_BY_LID = "DELETE FROM lands WHERE lid = ?";
	private static final String TOTAL_LAND = "SELECT COUNT(*) AS totalland FROM lands AS l INNER JOIN categories AS c ON c.cid = l.cid";
	private static final String TOTAL_LAND_BY_CID = "SELECT COUNT(*) AS totalland FROM lands AS l INNER JOIN categories AS c ON c.cid = l.cid WHERE l.cid = ?";
	private static final String FIND_ALL_PAGINATION = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid ORDER BY lid DESC LIMIT ?, ?";
	private static final String FIND_LAND_BY_CID_PAGINATION = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lands.cid = ? ORDER BY lid DESC LIMIT ?, ?";
	private static final String FIND_LASTED_LAND = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid ORDER BY count_views DESC LIMIT 0,5";
	private static final String FIND_LAND_BY_CID = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lands.cid = ? AND lid != ? ORDER BY lid DESC LIMIT 3";
	private static final String FIND_LAND_BY_SEARCH = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lname LIKE ? ORDER BY lid DESC";
	private static final String FIND_ALL_BY_CID = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lands.cid = ?";
	private static final String DELETE_LAND_BY_CID = "DELETE FROM lands WHERE cid = ?";
	/*private static final String FIND_ONE_NEXT = "SELECT COUNT(*) FROM lands WHERE lid <= ?";*/
	/*private static final String FIND_NEXT = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid LIMIT ?, 1";
	*/
	/*public int nextLand(int lid) {
		return jdbcTemplate.queryForObject(FIND_ONE_NEXT,new Object[] {lid} , Integer.class);
	}*/
	
	public int deleteByCid(int cid) {
		return jdbcTemplate.update(DELETE_LAND_BY_CID, new Object[] { cid });
	}

	public List<Land> getItemsByCid(int cid) {
		return jdbcTemplate.query(FIND_ALL_BY_CID, new Object[] { cid }, new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItemsBySearch(String search) {
		return jdbcTemplate.query(FIND_LAND_BY_SEARCH, new Object[] { "%" + search + "%" },
				new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItems() {
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItemCountViews() {
		return jdbcTemplate.query(FIND_LASTED_LAND, new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItems(int offset, int row_count) {
		return jdbcTemplate.query(FIND_ALL_PAGINATION, new Object[] { offset, row_count },
				new BeanPropertyRowMapper<Land>(Land.class));
	}
	

	public List<Land> getItemsByCid(Integer id, Integer lid) {
		return jdbcTemplate.query(FIND_LAND_BY_CID, new Object[] { id, lid },
				new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItemsByCid(Integer id, int offset, int row_count) {
		return jdbcTemplate.query(FIND_LAND_BY_CID_PAGINATION, new Object[] { id, offset, row_count },
				new BeanPropertyRowMapper<Land>(Land.class));
	}

	public int addItem(Land objLand) {
		return jdbcTemplate.update(INSERT_SQL, new Object[] { objLand.getLname(), objLand.getDescription(),
				objLand.getDetail(), objLand.getCid(), objLand.getPicture(), objLand.getArea(), objLand.getAddress() });
	}

	public Land getItemByLid(int lid) {
		try {
			return jdbcTemplate.queryForObject(FIND_ONE_BY_LID, new Object[] { lid },
					new BeanPropertyRowMapper<Land>(Land.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int editItem(Land objLand) {
		return jdbcTemplate.update(UPDATE_ONE,
				new Object[] { objLand.getLname(), objLand.getDescription(), objLand.getDetail(), objLand.getCid(),
						objLand.getPicture(), objLand.getArea(), objLand.getAddress(), objLand.getLid() });
	}

	public int deleteItem(int lid) {
		return jdbcTemplate.update(DELETE_ONE_BY_LID, new Object[] { lid });
	}

	public int totalLand() {
		return jdbcTemplate.queryForObject(TOTAL_LAND, Integer.class);
	}

	public int totalLanByCid(Integer cid) {
		return jdbcTemplate.queryForObject(TOTAL_LAND_BY_CID, new Object[] { cid }, Integer.class);
	}
}
