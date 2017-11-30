package data;

import java.util.List;

import entities.Item;

public interface ItemDAO {

	
	//create item
	public Item createItem(Item item);
	
	//read item
	public List<Item> getAllItems();
	public List<Item> getOfferedItemsByUserId(int id);
	public List<Item> getOfferedItemsByTitle(String title);
	public List<Item> getAvailableItemsByUserId(int id);
	public Item getItemById(int id);
	
	//update item
	public Item updateItem(Item item);
	
	//delete item
	public boolean deleteItem(Item item);
	

	
}
