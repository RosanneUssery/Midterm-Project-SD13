package data;

import entities.Address;

public interface AddressDAO {
	
	
	//create address
	public Address createAddress(Address address);
	
	//read address
	public Address getAddressByUserId(int id);
	
	//update address
	public Address updateAddress(Address address);
	
	//delete address
	public boolean deleteAddress(Address address);

}
