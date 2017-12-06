package data;

import java.util.List;

import entities.Address;
import entities.Login;
import entities.User;

public interface UserDAO {

		//create user
		public User createUser(UserDTO dto);
		
		//read user
		public List<User> getAllUsers();
		public User getUserById(int id);
		public UserDTO getUserDtoByUserId(int id);
		public User userLogin(String userEmail, String userPass);
		
		//update user
		public User updateUser(User user);
		public User updateUserByDto(UserDTO dto);
		
		//delete user
		public boolean deleteUser(User user);
		
		
		
	
}
