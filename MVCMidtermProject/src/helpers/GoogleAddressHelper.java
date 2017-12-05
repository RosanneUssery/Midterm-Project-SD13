package helpers;

import org.springframework.stereotype.Component;

import entities.Address;

@Component
public class GoogleAddressHelper {
	public String gMapsEmbedFormatter(String address) {
		// null check and empty string check values for property of address
		// if they're not null, then concat them together
		String ec = "";
		if (address != null) {
			StringBuilder sb = new StringBuilder();
			String[] streetArr = address.split(" ");
			sb.append(String.join("+", streetArr));
			ec = sb.toString();
		} else {
			ec = null;
		}

		return ec;

	}

	public static void main(String[] args) {
		// test goes here
	}

}
