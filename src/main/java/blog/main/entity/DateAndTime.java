package blog.main.entity;

import java.sql.Date;

public class DateAndTime {

	// converting post sql date format to blog format

	public String formatDate(Date date) {

		int year = date.toLocalDate().getYear();
		int month = date.toLocalDate().getMonthValue();
		int day = date.toLocalDate().getDayOfMonth();

		return day + " " + this.month(month) + " | " + year;

	}

	private String month(int month) {

		switch (month) {
		case 1:
			return "January";
		case 2:
			return "February";
		case 3:
			return "March";
		case 4:
			return "April";
		case 5:
			return "May";
		case 6:
			return "June";
		case 7:
			return "July";
		case 8:
			return "August";
		case 9:
			return "September";
		case 10:
			return "October";
		case 11:
			return "November";
		case 12:
			return "December";

		default:
			break;
		}

		return null;

	}

	// calculating time passed for posts

	public String timePassed(Date date) {

		// passed date
		int year = date.toLocalDate().getYear();
		int month = date.toLocalDate().getMonthValue();
		int day = date.toLocalDate().getDayOfMonth();

		// current date
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date currDate = new java.sql.Date(utilDate.getTime());

		int currYear = currDate.toLocalDate().getYear();
		int currMonth = currDate.toLocalDate().getMonthValue();
		int currDay = currDate.toLocalDate().getDayOfMonth();

		// calculating values
		int d = 0;
		int m = 0;
		int y = 0;

		if (currYear - year == 0) {

			if (currMonth - month == 0) {

				d = currDay - day;

			} else {

				m = currMonth - month;

			}

		} else {

			y = currYear - year;

		}

		// returning
		if (y > 0) {

			if (y == 1) {
				return "Last year";
			}

			return y + " years ago";
		}

		if (m > 0) {

			if (m == 1) {
				return "Last month";
			}

			return m + " months ago";
		}

		if (d == 0) {

			return "Today";

		} else {

			if (d == 1) {
				return d + " day ago";
			}

			return d + " days ago";
		}

	}

}
