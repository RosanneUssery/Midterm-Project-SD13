package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Address;
import entities.Login;
import entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user, Address address, Login login) {
		
		//first insert the address, get back the id
        em.persist(address);
        em.flush();
        
        //attach address and email to user
        user.setAddress(address);
        user.setEmail(login.getUserEmail());
        
        //persist user before login, because login table depends on user email being present
        em.persist(user);
        
        //now we can persist login
        em.persist(login);

        //get it all back
        em.flush();
        
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		
		String query = "select u From User u";
		return em.createQuery(query, User.class).getResultList();
		
	}

	@Override
	public User getUserById(int id) {
		
        User u = em.find(User.class, id);
		return u;
	}
	

	@Override
	public User userLogin(String userEmail, String userPass) {
		User u = null;
		String query = "SELECT l FROM Login l WHERE user_email = :userEmail";
		try {
			Login l = em.createQuery(query, Login.class).setParameter("userEmail", userEmail).getResultList().get(0);
			if (l.getUserEmail().equals(userEmail) && l.getPwd().equals(userPass)) {
				query = "SELECT u FROM User u WHERE email = :email";
				u = em.createQuery(query, User.class).setParameter("email", userEmail).getResultList().get(0);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	
		return u;
	}

	@Override
	public User updateUser(User user) {

        User managed = em.find(User.class, user.getId());
        managed = user;
        return managed;
	}

	@Override
	public boolean deleteUser(User user) {
		
		User u = em.find(User.class, user.getId());
		em.remove(u);
		if(em.find(User.class,user.getId()) == null) {
			return true;
		}
		return false;
	}

}
