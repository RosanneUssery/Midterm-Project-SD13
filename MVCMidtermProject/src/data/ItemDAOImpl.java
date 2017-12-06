package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

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

    public List<Item> getItemsByOwnerAddressWithZipCode(String title, String zip ) {
    		String query;
    		TypedQuery<Item> itemQuery; 
    		String shortened = title.toLowerCase();
    		if (shortened.charAt(shortened.length()-1) == 's') {
    			shortened = shortened.substring(0, shortened.length()-1);
    		}
    		System.out.println(shortened);
    		if (zip.equals("")) {
    			query = "SELECT i FROM Item i WHERE LOWER(i.title) LIKE :title";
    			itemQuery = em.createQuery(query, Item.class)
        				.setParameter("title", "%" + shortened + "%"); 
    		} else {
    			query = "SELECT i FROM Item i WHERE i.owner.address.zip = :zip AND LOWER(i.title) LIKE :title";
    			itemQuery = em.createQuery(query, Item.class)
        				.setParameter("title", "%" + shortened + "%") 
    					.setParameter("zip", zip);
    		}
    		List<Item> items = itemQuery
                .getResultList();
        
//    		String query = "SELECT * FROM item WHERE LOWER(title) LIKE ?";
//    		List<Item> items = em.createNativeQuery(query, Item.class)
//    							.setParameter(1, "%"+title+"%")
//    							.getResultList();
        if (items.size() > 0) {
        		items.forEach((i) -> System.out.println(i.getTitle()));
        } else {
        		System.err.println("NO RESULTS");
        }
        //SELECT a.street, a.city, a.state, a.zip, i.title FROM address a JOIN user u ON a.id = u.address_id 
        //JOIN item i ON u.id = i.owner_id WHERE a.zip = 80111 AND i.title = 'nuts';
        return items;
    }

}
