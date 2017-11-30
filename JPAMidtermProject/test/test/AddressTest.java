package test;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;

import com.sun.jndi.cosnaming.IiopUrl.Address;

public class AddressTest {

	@PersistenceContext
	private EntityManager em;
	private Address add;

	@Before
	public void setUp() throws Exception {
		add = em.find(Address.class, 1);

	}

	@After
	public void tearDown() throws Exception {
		add = null;
	}
}
