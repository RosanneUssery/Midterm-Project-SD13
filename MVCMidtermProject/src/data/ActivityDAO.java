package data;

import java.util.List;

import entities.Activity;
import entities.Item;
import entities.User;

public interface ActivityDAO {
	
	
	//create activity
	public Activity createItemRequest(Item item, User borrower);
	
	//read activity
	public List<Activity> viewActivityByItem(Item item);
	public List<Activity> viewActivityByUser(User user);
	public List<Activity> getNewRequestsByUser(User user);
	public Activity getActivityById(int id);
	
	//update activity
	public Activity confirmLend(Activity activity);
	public Activity confirmReturn(Activity activity);
	
	//delete activity
	public boolean deleteActivity(Activity activity);
	

}
