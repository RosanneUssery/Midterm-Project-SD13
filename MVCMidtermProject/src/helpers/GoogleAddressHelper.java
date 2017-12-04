package helpers;

import org.springframework.stereotype.Component;

import entities.Address;

@Component
public class GoogleAddressHelper {
	public String gMapsEmbedFormatter (String equipmentCity) {
//		null check and empty string check values for property of address
//		if they're not null, then concat them together 
		
		StringBuilder sb = new StringBuilder();
		String street = "";
		String [] streetArr = street.split(" ");
		
		sb.append(String.join("+", streetArr));
		return sb.toString();
		
	}
	
	public static void main(String[] args) {
		
	}

}
