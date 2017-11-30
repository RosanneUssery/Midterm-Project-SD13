package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Item;



@Repository
@Transactional
public class ItemDAOImpl implements ItemDAO {

	@PersistenceContext
	private EntityManager em;
	
	

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

	
}
