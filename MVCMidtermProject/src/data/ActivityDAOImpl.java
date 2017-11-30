package data;

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
