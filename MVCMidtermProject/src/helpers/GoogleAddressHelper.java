package helpers;

import org.springframework.stereotype.Component;

@Component
public class GoogleAddressHelper {
	public String gMapsEmbedFormatter (String equipmentCity) {
//		null check and empty string check values for property of address
//		if they're not null, then concat them together 
		String ec = "";
		if (equipmentCity !=  null) {
		StringBuilder sb = new StringBuilder();
		String street = "";
		String [] streetArr = street.split(" ");
		
		sb.append(String.join("+", streetArr));
		
		ec = sb.toString();
		} else {
			ec = null;
		}
		
		return ec;
		
	}
	
	public static void main(String[] args) {
		//test goes here
	}

}
