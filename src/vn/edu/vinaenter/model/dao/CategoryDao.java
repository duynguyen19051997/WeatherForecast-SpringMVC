package vn.edu.vinaenter.model.dao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.model.bean.Category;

@Repository
public class CategoryDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String FIND_ALL_PAGINATION = "SELECT * FROM categories ORDER BY cid DESC LIMIT ?, ?";
	private static final String FIND_ALL = "SELECT * FROM categories ORDER BY cid DESC";
	private static final String INSERT_SQL = "INSERT INTO categories(cname) VALUES(?)";
	private static final String FIND_ONE_BY_CID = "SELECT * FROM categories WHERE cid = ?";
	private static final String DELETE_ONE_BY_CID = "DELETE FROM categories WHERE cid = ?";
	private static final String EDIT_ONE_BY_CID = "UPDATE categories SET cname = ? WHERE cid = ?";
	private static final String FIND_CAT_BY_SEARCH = "SELECT * FROM categories WHERE cname LIKE ?";
	private static final String TOTAL_CAT = "SELECT COUNT(*) FROM categories";

	public List<Category> getItems(int offset, int rowCount) {
		return jdbcTemplate.query(FIND_ALL_PAGINATION, new Object[] { offset, rowCount },
				new BeanPropertyRowMapper<Category>(Category.class));
	}

	public List<Category> getItems() {
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<Category>(Category.class));
	}

	public int addItem(Category objCat) {
		return jdbcTemplate.update(INSERT_SQL, new Object[] { objCat.getCname() });
	}

	public Category getItemByCid(Integer cid) {
		try {
			return jdbcTemplate.queryForObject(FIND_ONE_BY_CID, new Object[] { cid },
					new BeanPropertyRowMapper<Category>(Category.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int deleteItem(int cid) {
		return jdbcTemplate.update(DELETE_ONE_BY_CID, new Object[] { cid });
	}

	public int editItem(@Valid Category objCat) {
		return jdbcTemplate.update(EDIT_ONE_BY_CID, new Object[] { objCat.getCname(), objCat.getCid() });

	}

	public List<Category> getItemsBySearch(String search) {
		return jdbcTemplate.query(FIND_CAT_BY_SEARCH, new Object[] { "%" + search + "%" },
				new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	public int totalCat() {
		return jdbcTemplate.queryForObject(TOTAL_CAT, Integer.class);
	}

}
