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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Address getAddressByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Address updateAddress(Address address) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteAddress(Address address) {
		// TODO Auto-generated method stub
		return false;
	}

}
