package data;

import java.util.List;

import entities.Activity;
import entities.Address;
import entities.Item;
import entities.User;

public class InventoryDAOImpl implements InventoryDAO {

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Item createItem(Item item) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getAllItems() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getOfferedItemsByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getBorrowedItemsByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getOfferedItemsByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Item updateItem() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteItem() {
		// TODO Auto-generated method stub
		return false;
	}

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

	@Override
	public Activity createItemRequest(Item item, User borrower) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> viewActivityByItem(Item item) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> viewActivityByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Activity confirmLend(Activity activity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Activity confirmReturn(Activity activity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteActivity(Activity activity) {
		// TODO Auto-generated method stub
		return false;
	}

}
