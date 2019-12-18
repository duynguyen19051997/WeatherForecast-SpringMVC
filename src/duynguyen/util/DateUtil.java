package duynguyen.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DateUtil {

	public static String getTime(int milliseconds) {
		String dateFormat = "hh:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		return simpleDateFormat.format(milliseconds);
	}

	public static List<String> getDayOfWeek(Timestamp time) {
		List<String> list = new ArrayList<String>();
		LocalDate ld = LocalDate.of(convertTodayIntoYear(time), convertTodayIntoMonth(time), convertTodayIntoDay(time));
		DayOfWeek d = DayOfWeek.from(ld);
		int num = d.getValue();
		for (int i = 0; i <= 6; i++) {
			num++;
			if (num == 7) {
				num = 0;
			}
			list.add(getDayOfWeekIntoString(num));
		}
		return list;
	}

	public static String getDayOfWeekIntoString(int num) {
		String x = "";
		switch (num) {
		case 0:
			x = "Saturday";
			break;
		case 1:
			x = "Sunday";
			break;
		case 2:
			x = "Monday";
			break;
		case 3:
			x = "Tuesday";
			break;
		case 4:
			x = "Wednesday";
			break;
		case 5:
			x = "Thursday";
			break;
		case 6:
			x = "Friday";
			break;
		}
		return x;
	}

	public static int convertTodayIntoDay(Timestamp time) {
		Date date = new Date();
		String dateFormat = "dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		return Integer.parseInt(simpleDateFormat.format(date));
	}

	public static int convertTodayIntoMonth(Timestamp time) {
		Date date = new Date();
		String dateFormat = "MM";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		return Integer.parseInt(simpleDateFormat.format(date));
	}

	public static int convertTodayIntoYear(Timestamp time) {
		Date date = new Date();
		String dateFormat = "yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		return Integer.parseInt(simpleDateFormat.format(date));
	}

	public static String convertTodayIntoString(Timestamp time) {
		Date date = new Date();
		String dateFormat = "dd MMM yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		return simpleDateFormat.format(date);
	}

	public static String convertTimestampIntoString(Timestamp time) {
		String dateFormat = "dd MMM yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		return simpleDateFormat.format(time);
	}

}
