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
  textStyle: roboto,
);

ButtonStyle redButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.red.shade900,
  backgroundColor: Colors.red.shade200,
  textStyle: roboto,
);

ButtonStyle blueButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.blue.shade900,
  backgroundColor: Colors.blue.shade200,
  textStyle: roboto,
);

ButtonStyle yellowButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.yellow.shade900,
  backgroundColor: Colors.yellow.shade200,
  textStyle: roboto,
);

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
