package test.test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Login;
import entities.User;

public class UserTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	private Login login;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		login = em.find(Login.class, "first@first.com");
		user = em.find(User.class, 1);

	}
	
	
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		user = null;
		login = null;
	}
	
	
	@Test
	public void test_user_login_email() {
    	assertEquals("first@first.com",login.getUserEmail());
    	assertEquals("1",login.getPwd());
    	
    	assertEquals(1, user.getId());
    	assertEquals("first@first.com", user.getEmail());
    	assertEquals(login.getUserEmail(), user.getEmail());
    	
	}
	
}
