package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Item;

public class JPQLItemTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Item item;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		item = em.find(Item.class, 1);

	}
	

	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		item = null;
	}
	
	@Test
	public void test_item() {
    	assertEquals("Blankets", item.getTitle());
	}
	
	@Test
	public void test_owner_availability() {
	 	assertEquals(true, item.isAvailable());
	 	assertEquals(1, item.getId());

	}
	
	
}
