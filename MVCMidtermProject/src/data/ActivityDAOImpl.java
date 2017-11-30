package data;

import java.util.List;

import entities.Activity;
import entities.Item;
import entities.User;

public class ActivityDAOImpl implements ActivityDAO {

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
