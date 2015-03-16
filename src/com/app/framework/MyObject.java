package com.app.framework;

public class MyObject {

	public static Integer stringToInt(String number) {

		if (number == null) {
			return null;
		}

		try {
			return Integer.parseInt(number);

		} catch (NumberFormatException e) {
			return null;
		}
	}

	public static Double stringToDouble(String number) {

		if (number == null) {
			return null;
		}

		try {
			return Double.parseDouble(number);

		} catch (NumberFormatException e) {
			return null;
		}
	}

}
