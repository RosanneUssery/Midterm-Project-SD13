package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Address;

@Repository
@Transactional
public class AddressDAOImpl implements AddressDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Address createAddress(Address address) {
		   em.persist(address);
	        em.flush();
		return address;
	}

	@Override
	public Address getAddressByUserId(int id) {
		  Address a = em.find(Address.class, id);
			return a;
	}

	@Override
	public Address updateAddress(Address address) {
		 Address managed = em.find(Address.class, address.getId());
	        managed = address;
	        return managed;
		
	}

	@Override
	public boolean deleteAddress(Address address) {
		Address a = em.find(Address.class, address.getId());
		em.remove(a);
		if(em.find(Address.class,address.getId()) == null) {
			return true;
		}
		return false;
	}

}
