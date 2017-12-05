package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Login;

public class LoginTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Login login;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		login = em.find(Login.class, "alexis.low@gmail.com");

	}
	
	@Test
	public void test_getActivityId() {
		assertEquals("alexis.low@gmail.com", login.getUserEmail());
		assertEquals("alexis", login.getPwd());
	}
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		login = null;
	}
}
