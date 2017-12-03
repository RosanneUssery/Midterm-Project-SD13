package test.test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Activity;

public class ActivityTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Activity activity;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		activity = em.find(Activity.class, 1);

	}
	
	
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		activity = null;
	}
	
	@Test
	public void test_activity() {
    	assertEquals(1, activity.getId());
    	assertEquals(1, activity.getBorrower().getId());
    	assertEquals("Heero", activity.getBorrower().getFirstName());
	}
	
	@Test
	public void test_new_request_by_user() {
		assertEquals(3, activity.getItem().getId());
		assertEquals(2, activity.getItem().getOwnerId().getId());
	}
}

