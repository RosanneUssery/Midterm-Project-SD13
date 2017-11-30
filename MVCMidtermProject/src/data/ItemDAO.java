package data;

import java.util.List;

import entities.Item;

public interface ItemDAO {

	
	//create item
	public Item createItem(Item item);
	
	//read item
	public List<Item> getAllItems();
	public List<Item> getOfferedItemsByUserId(int id);
	public List<Item> getBorrowedItemsByUserId(int id);
	public List<Item> getOfferedItemsByType(String type);
	
	//update item
	public Item updateItem(Item item);
	
	//delete item
	public boolean deleteItem(Item item);
	

	
}
