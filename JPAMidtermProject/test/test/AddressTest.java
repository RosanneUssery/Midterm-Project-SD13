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
	private EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("MidtermPU");
		this.em = emf.createEntityManager();
		address = em.find(Address.class, 1);

	}
	
	@Test
	public void test_getAddressId() {
		assertEquals(1, address.getId());
	}
	
	@Test
	public void test_address_mappings() {
		assertEquals("1st", address.getStreet());
		assertEquals("Primary", address.getCity());
		assertEquals("One", address.getState());
		assertEquals("11111", address.getZip());
	}
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		address = null;
	}
}
