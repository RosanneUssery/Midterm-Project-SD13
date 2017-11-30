package data;

import java.util.List;

import entities.User;

public interface UserDAO {

	//create user
		public User createUser(User user);
		
		//read user
		public List<User> getAllUsers();
		public User getUserById(int id);
		
		//update user
		public User updateUser(User user);
		
		//delete user
		public boolean deleteUser(User user);
		
		
		
	
}
