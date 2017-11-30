package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Address;


public class AddressTest {

//	@PersistenceContext
	private EntityManagerFactory emf;
	private EntityManager em;
	private Address add;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		
		add = em.find(Address.class, 1);

	}
	
	@Test
	public void address_has_id() {
		assertEquals(1, add.getId());
	}

	@After
	public void tearDown() throws Exception {
		add = null;
	}
}
