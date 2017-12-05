package entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "activity")
public class Activity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name = "borrower_id")
	private User borrower;
	
	@OneToOne
	@JoinColumn(name = "item_id")
	private Item item;
	
	@Column(name = "date_lent")
	private Date dateLent;
	
	@Column(name = "due_date")
	private Date dueDate;
	
	@Column(name = "is_returned")
	private boolean isReturned;
	

	public boolean getIsReturned() {
		return isReturned;
	}

	public void setIsReturned(boolean isReturned) {
		this.isReturned = isReturned;
	}

	public User getBorrower() {
		return borrower;
	}

	public void setBorrower(User borrower) {
		this.borrower = borrower;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Date getDateLent() {
		return dateLent;
	}

	public void setDateLent(Date dateLent) {
		this.dateLent = dateLent;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public int getId() {
		return id;
	}


	@Override
	public String toString() {
		return "Activity [id=" + id + ", borrower=" + borrower + ", item=" + item + ", dateLent=" + dateLent
				+ ", dueDate=" + dueDate + ", returned=" + isReturned + "]";
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
		Activity other = (Activity) obj;
		if (id != other.id)
			return false;
		return true;
	}
	

}
