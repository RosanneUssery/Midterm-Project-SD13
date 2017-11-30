package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Item;
import entities.User;



@Repository
@Transactional
public class ItemDAOImpl implements ItemDAO {

	@PersistenceContext
	private EntityManager em;
	
	

	@Override
	public Item createItem(Item item) {
		   em.persist(item);
	        em.flush();
		return item;
	}

	@Override
	public List<Item> getAllItems() {
		String query = "select i From Item i";
		return em.createQuery(query, Item.class).getResultList();
		
	}

	@Override
	public List<Item> getOfferedItemsByUserId(int id) {// Check-------------------
		String query = "select i From Item i Where user_id = :id";
		return em.createQuery(query, Item.class).setParameter("id", id).getResultList();
	}

	@Override
	public List<Item> getBorrowedItemsByUserId(int id) {// Check-------------------
		String query = "select i From Item i Where user_id = :id";
		return em.createQuery(query, Item.class).setParameter("id", id).getResultList();
	}

	@Override
	public List<Item> getOfferedItemsByType(String type) {// Check-------------------
		String query = "select i From Item i Where user_id = :id";
		return em.createQuery(query, Item.class).setParameter("id", id).getResultList();
	}

	@Override
	public Item updateItem(Item item) {
		Item managed = em.find(Item.class, item.getId());
        managed = item;
        return managed;
	}

	@Override
	public boolean deleteItem(Item item) {
		Item i = em.find(Item.class, item.getId());
		em.remove(i);
		if(em.find(Item.class,item.getId()) == null) {
			return true;
		}
		return false;
	}

	
}
