package data;

import java.util.List;

import entities.Activity;
import entities.Address;
import entities.Item;
import entities.User;

public interface InventoryDAO {

	//create user
	public User createUser(User user);
	
	//read user
	public List<User> getAllUsers();
	public User getUserById(int id);
	
	//update user
	public User updateUser(User user);
	
	//delete user
	public boolean deleteUser(User user);
	
	
	
	//create item
	public Item createItem(Item item);
	
	//read item
	public List<Item> getAllItems();
	public List<Item> getOfferedItemsByUserId(int id);
	public List<Item> getBorrowedItemsByUserId(int id);
	public List<Item> getOfferedItemsByType(String type);
	
	//update item
	public Item updateItem();
	
	//delete item
	public boolean deleteItem();
	
	
	
	//create address
	public Address createAddress(Address address);
	
	//read address
	public Address getAddressByUserId(int id);
	
	//update address
	public Address updateAddress(Address address);
	
	//delete address
	public boolean deleteAddress(Address address);
	
	
	
	//create activity
	public Activity createItemRequest(Item item, User borrower);
	
	//read activity
	public List<Activity> viewActivityByItem(Item item);
	public List<Activity> viewActivityByUser(User user);
	
	//update activity
	public Activity confirmLend(Activity activity);
	public Activity confirmReturn(Activity activity);
	
	//delete activity
	public boolean deleteActivity(Activity activity);
	
}
