package data;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Activity;
import entities.Item;
import entities.User;

@Repository
@Transactional
public class ActivityDAOImpl implements ActivityDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Activity createItemRequest(Item item, User borrower) {

		Activity a = new Activity();
		Item managedItem = em.find(Item.class, item.getId());
		managedItem.setIsAvailable(false);
		a.setItem(managedItem);
		a.setBorrower(borrower);
		em.persist(a);
		em.flush();
		return a;
	}
	
	

	@Override
	public List<Activity> getAllActivity() {
		String query = "SELECT a FROM Activity a";
		return em.createQuery(query, Activity.class).getResultList();
	}



	@Override
	public List<Activity> viewActivityByItem(Item item) {
		String query = "select a From Activity a Where item_id = :id";
		return em.createQuery(query, Activity.class).setParameter("id", item.getId()).getResultList();
	}

	@Override
	public List<Activity> viewActivityByUser(User user) {
		String query = "select a From Activity a Where borrower_id = :id";
		return em.createQuery(query, Activity.class).setParameter("id", user.getId()).getResultList();
	}
	
	@Override
	public List<Activity> getNewRequestsByUser(User user) {
		String query = "SELECT a FROM Activity a WHERE a.item.owner.id = :id";
		return em.createQuery(query, Activity.class).setParameter("id", user.getId()).getResultList();
	}

	@Override
	public Activity confirmLend(Activity activity) {
		Activity managedActivity = em.find(Activity.class, activity.getId());
		
		managedActivity.setDateLent(Date.valueOf(LocalDate.now()));
		managedActivity.setDueDate(Date.valueOf(LocalDate.now().plusDays(30)));
		
		managedActivity.setIsReturned(false);
		return managedActivity;
	}

	@Override
	public Activity confirmReturn(Activity activity) {
		Activity managedActivity = em.find(Activity.class, activity.getId());
		managedActivity.setIsReturned(true);
		
		Item managedItem = em.find(Item.class, activity.getItem().getId());
		managedItem.setIsAvailable(true);

		return managedActivity;
	}
	
	

	@Override
	public Activity updateActivity(Activity activity) {
		Activity managedActivity = em.find(Activity.class, activity.getId());
		managedActivity.setDateLent(activity.getDateLent());
		managedActivity.setDueDate(activity.getDueDate());
		managedActivity.setIsReturned(activity.getIsReturned());
		return managedActivity;
	}



	@Override
	public boolean deleteActivity(Activity activity) {
		Activity a = em.find(Activity.class, activity.getId());
		em.remove(a);
		if(em.find(User.class,activity.getId()) == null) {
			return true;
		}
		return false;
	}
	@Override
	public Activity getActivityById(int id) {
		return em.find(Activity.class, id);
	
	}

}
