package vn.edu.vinaenter.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.model.bean.Contact;

@Repository
public class ContactDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String INSERT_CONTACT = "INSERT INTO vnecontact(fullname, email, subject, content) VALUES(?,?,?,?)";
	private static final String FIND_ALL = "SELECT * FROM vnecontact ORDER BY cid DESC";
	private static final String TOTAL_CONTACT = "SELECT COUNT(*) FROM vnecontact";
	private static final String FIND_ALL_PAGINATION = "SELECT * FROM vnecontact ORDER BY cid DESC LIMIT ?, ?";
	private static final String FIND_ONE_BY_CID = "SELECT * FROM vnecontact WHERE cid = ?";
	private static final String EDIT_ONE = "UPDATE vnecontact SET fullname = ?, email = ?, subject = ?, content = ? WHERE cid = ?";
	private static final String DELETE_ONE = "DELETE FROM vnecontact WHERE cid = ?";
	private static final String FIND_ALL_BY_SEARCH = "SELECT * FROM vnecontact WHERE fullname LIKE ?";

	public int addItem(Contact objCon) {
		return jdbcTemplate.update(INSERT_CONTACT,
				new Object[] { objCon.getFullname(), objCon.getEmail(), objCon.getSubject(), objCon.getContent() });
	}

	public List<Contact> getItems() {
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public int totalContact() {
		return jdbcTemplate.queryForObject(TOTAL_CONTACT, Integer.class);
	}

	public List<Contact> getItems(int offset, int rowCount) {
		return jdbcTemplate.query(FIND_ALL_PAGINATION, new Object[] { offset, rowCount },
				new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public Contact getItemByCid(Integer cid) {
		try {
			return jdbcTemplate.queryForObject(FIND_ONE_BY_CID, new Object[] { cid },
					new BeanPropertyRowMapper<Contact>(Contact.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int editItem(Contact objCon) {
		return jdbcTemplate.update(EDIT_ONE, new Object[] { objCon.getFullname(), objCon.getEmail(),
				objCon.getSubject(), objCon.getContent(), objCon.getCid() });
	}

	public int deleteItem(Integer cid) {
		return jdbcTemplate.update(DELETE_ONE, new Object[] { cid });
	}

	public List<Contact> getItemBySearch(String search) {
		return jdbcTemplate.query(FIND_ALL_BY_SEARCH, new Object[] { "%" + search + "%"},
				new BeanPropertyRowMapper<Contact>(Contact.class));
	}
}
