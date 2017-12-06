package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

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
	
	@Test
	public void test_getUserId() {
		assertEquals(1, user.getId());
	}
	
	@Test
	public void test_user_mapping() {
		assertEquals("Vivian", user.getFirstName());
		assertEquals("Caethe", user.getLastName());
		assertEquals("5551234567", user.getPhone());
		assertEquals("vivian.caethe@gmail.com", user.getEmail());
		assertEquals(2, user.getPermissionLevel());
	}
	
	@Test
	public void test_address_to_user_mapping() {
		assertEquals("Aurora", user.getAddress().getCity());
	}
	
//	No longer have public user
//	@Test
//	public void test_public_user() {
//		user = em.find(User.class, 4);
//		assertTrue(user.getPermissionLevel() == 1);
//	}
	
	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
		user = null;
	}
}
