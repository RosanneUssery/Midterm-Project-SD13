package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Address;


public class JPQLAddressTest {
    private EntityManagerFactory emf;
    private EntityManager em;
    private Address address;

    @Before
    public void setUp() throws Exception {
        this.emf = Persistence.createEntityManagerFactory("MidtermPU");
        this.em = emf.createEntityManager();
        address = em.find(Address.class, 1);

    }
    
  
    
    @After
    public void tearDown() throws Exception {
        this.em.close();
        this.emf.close();
        address = null;
    }
    
	
	@Test
	public void test_address_maping() {
	    	assertEquals("18904 E Berry Dr", address.getStreet());
	    	assertEquals("Aurora", address.getCity());
	    	assertEquals("Colorado", address.getState());
	    	assertEquals("80015", address.getZip());
	    	
	    	address = em.find(Address.class, 2);
	    	assertEquals(2, address.getId());
	    	assertEquals("225 S Newton St", address.getStreet());
	    	assertEquals("Denver", address.getCity());
	    	assertEquals("Colorado", address.getState());
	    	assertEquals("80219", address.getZip());
	}
	
}
