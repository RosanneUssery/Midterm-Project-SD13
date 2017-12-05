package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Item;

public class ItemTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Item item;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		item = em.find(Item.class, 1);

	}
	
	@Test
	public void test_getItemId() {
		assertEquals(1, item.getId());
	}
	
	@Test
	public void test_item_mapping() {
		assertEquals("kennel", item.getTitle());
		assertEquals(" it is a kennel", item.getDescription());
		assertEquals(false, item.isSupply());
		assertEquals(true, item.isAvailable());
		
		item = em.find(Item.class, 9);
		assertEquals("seeds", item.getTitle());
		assertNotEquals(" yummy seeds ", item.getDescription());
		assertEquals(true, item.isSupply());
		assertEquals(true, item.isAvailable());
	}
	
	@Test 
	public void test_item_to_user() {
		assertEquals("Vivian", item.getOwner().getFirstName());
	}
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		item = null;
	}
}
