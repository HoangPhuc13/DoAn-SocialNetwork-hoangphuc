package common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MaHoa {
	public static String sha256Hash(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hashBytes = md.digest(input.getBytes());

			// Chuyển mảng byte thành chuỗi hex
			StringBuilder hexString = new StringBuilder();
			for (byte b : hashBytes) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}
