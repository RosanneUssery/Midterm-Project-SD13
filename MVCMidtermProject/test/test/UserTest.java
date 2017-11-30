package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.User;

public class UserTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		user = em.find(User.class, 1);

	}
	
	
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		user = null;
	}
}
