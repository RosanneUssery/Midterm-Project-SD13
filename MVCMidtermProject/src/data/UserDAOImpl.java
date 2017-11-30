package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {

        em.persist(user);
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
