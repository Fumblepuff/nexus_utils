import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'enums.dart';

// Text Styles
TextStyle roboto = GoogleFonts.robotoMono(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

TextStyle titleStyle = const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

TextStyle headerStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

TextStyle subheaderStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

TextStyle bodyStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle captionStyle = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

// Button Styles
ButtonStyle greenButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.green.shade900,
  backgroundColor: Colors.green.shade200,
  textStyle: roboto.copyWith(
    fontSize: 14,
  ),
);

ButtonStyle redButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.red.shade900,
  backgroundColor: Colors.red.shade200,
  textStyle: roboto.copyWith(
    fontSize: 14,
  ),
);

ButtonStyle blueButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.blue.shade900,
  backgroundColor: Colors.blue.shade200,
  textStyle: roboto.copyWith(
    fontSize: 14,
  ),
);

ButtonStyle yellowButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.yellow.shade900,
  backgroundColor: Colors.yellow.shade200,
  textStyle: roboto.copyWith(
    fontSize: 14,
  ),
);

ButtonStyle get inactiveButtonStyle {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.grey.shade700,
    backgroundColor: Colors.grey.shade300,
    textStyle: roboto.copyWith(
      fontSize: 14,
    ),
  );
}

// Text Formatting
String formatDate(
  DateTime date, {
  bool textMonth = false,
  bool shortMonth = true,
  bool showYear = true,
  bool shortYear = false,
  String separator = '/',
}) {
  String year = date.year.toString();
  if (shortYear) {
    year = year.substring(2);
  }
  if (textMonth) {
    Months month = Months.fromNumber(date.month);
    if (shortMonth) {
      return '${month.short} ${date.day}${showYear ? ', $year' : ''}';
    } else {
      return '${month.full} ${date.day}${showYear ? ', $year' : ''}';
    }
  } else {
    return '${date.month}$separator${date.day}${showYear ? '$separator$year' : ''}';
  }
}

String timeFormat(DateTime date) {
  int hour = date.hour;
  int minute = date.minute;
  String ampm = 'AM';
  if (hour > 12) {
    hour -= 12;
    ampm = 'PM';
  }
  if (hour == 0) {
    hour = 12;
  }
  if (hour == 12) {
    ampm = 'PM';
  }
  if (minute < 10) {
    return '$hour:0$minute $ampm';
  } else {
    return '$hour:$minute $ampm';
  }
}

String formatDateTime(DateTime date) {
  return '${formatDate(date)} ${timeFormat(date)}';
}

String phoneFormat(String phone) {
  phone = phone.replaceAll(RegExp(r'\D'), '');
  if (phone.length != 10) {
    return phone;
  }
  return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6, 10)}';
}

String timestampFormat(TimeOfDay time) {
  int hour = time.hour;
  int minute = time.minute;
  if (hour > 12) {
    hour -= 12;
  }
  if (minute < 10) {
    return '$hour:0$minute';
  }
  return '$hour:$minute';
}

String fullTimeStamp(TimeOfDay time) {
  int hour = time.hour;
  int minute = time.minute;
  String ampm = 'AM';
  if (hour > 12) {
    hour -= 12;
    ampm = 'PM';
  }
  if (minute < 10) {
    return '$hour:0$minute $ampm';
  }
  return '$hour:$minute $ampm';
}
