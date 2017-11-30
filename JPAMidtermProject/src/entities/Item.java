package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "item")
public class Item {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "owner_id")
	private User ownerId;
	// failed test due to int ownerId problem. Changed to object to solve.
	
	@Column(name = "is_supply")
	private boolean isSupply;
	
	@Column(name = "is_available")
	private boolean isAvailable;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(User ownerId) {
		this.ownerId = ownerId;
	}

	public boolean isSupply() {
		return isSupply;
	}

	public void setSupply(boolean isSupply) {
		this.isSupply = isSupply;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean available) {
		this.isAvailable = available;
	}

	public int getId() {
		return id;
	}


	@Override
	public String toString() {
		return "Item [id=" + id + ", title=" + title + ", description=" + description + ", isSupply=" + isSupply
				+ ", available=" + isAvailable + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
}
