package data;

import java.util.List;

import entities.Activity;
import entities.Address;
import entities.Item;
import entities.User;

public interface ItemDAO {

	
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
	

	
}
