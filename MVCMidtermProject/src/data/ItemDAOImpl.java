package data;

import java.util.ArrayList;
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
		   em.persist(item);
	        em.flush();
		return item;
	}
	
	

	@Override
	public Item getItemById(int id) {
		return em.find(Item.class, id);
	}

	@Override
	public List<Item> getAllItems() {
		String query = "select i From Item i";
		return em.createQuery(query, Item.class).getResultList();
		
	}

	@Override
	public List<Item> getOfferedItemsByUserId(int id) {
		String query = "select i From Item i Where owner_id = :id";
		return em.createQuery(query, Item.class).setParameter("id", id).getResultList();
	}
	@Override
	public List<Item> getAvailableItemsByUserId(int id) {
		String query = "select i From Item i Where owner_id = :id And is_available = 1";
		return em.createQuery(query, Item.class).setParameter("id", id).getResultList();
	}
	
	@Override
	public List<Item> getOfferedItemsByTitle(String title) {
		String query = "select i From Item i Where title = :title";
		return em.createQuery(query, Item.class).setParameter("title", title).getResultList();
	}

	@Override
	public Item updateItem(Item item) {
		System.out.println(item);
		Item managed = em.find(Item.class, item.getId());
		System.out.println(managed);
		managed.setTitle(item.getTitle());
		managed.setDescription(item.getDescription());
		managed.setIsSupply(item.getIsSupply());
		managed.setIsAvailable(item.getIsAvailable());
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

    public List<Item> getItemsByOwnerAddressWithZipCode(String zip, String title) {
        String query = "SELECT i FROM Item i WHERE i.owner.address.zip = :zip AND LOWERCASE(i.title) LIKE :title";
        return em.createQuery(query, Item.class)
                .setParameter("zip", zip)
                .setParameter("title", "%" + title.toLowerCase() + "%") //% allows for plural and modified matches
                .getResultList();
        
        //SELECT a.street, a.city, a.state, a.zip, i.title FROM address a JOIN user u ON a.id = u.address_id 
        //JOIN item i ON u.id = i.owner_id WHERE a.zip = 80111 AND i.title = 'nuts';

    }

}
