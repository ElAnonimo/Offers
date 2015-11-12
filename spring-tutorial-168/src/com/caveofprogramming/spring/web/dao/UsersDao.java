package com.caveofprogramming.spring.web.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("usersDao")
public class UsersDao {

	// private NamedParameterJdbcTemplate jdbc;			// we no longer query with SQL. We do now with HQL
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private SessionFactory sessionFactory;

//	@Autowired											// we no longer query with SQL. We do now with HQL
//	public void setDataSource(DataSource jdbc) {
//		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
//	}
	
	public Session session() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public void create(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		session().save(user);
	}

	public boolean exists(String username) {
//		return jdbc.queryForObject("select count(*) from users where username=:username", 
//				new MapSqlParameterSource("username", username), Integer.class) > 0;
		
		User user = getUser(username);
		return user != null;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> getAllUsers() {
		// return jdbc.query("select * from users", BeanPropertyRowMapper.newInstance(User.class));
		return session().createQuery("from User").list();
	}

	public User getUser(String username) {
		Criteria crit = session().createCriteria(User.class);
		// crit.add(Restrictions.eq("username", username));   // good for querying by the primary key
		crit.add(Restrictions.idEq(username));
		return (User)crit.uniqueResult();
	}

}
