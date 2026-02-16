import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Months {
  january(1, 'January', 'Jan'),
  february(2, 'February', 'Feb'),
  march(3, 'March', 'Mar'),
  april(4, 'April', 'Apr'),
  may(5, 'May', 'May'),
  june(6, 'June', 'Jun'),
  july(7, 'July', 'Jul'),
  august(8, 'August', 'Aug'),
  september(9, 'September', 'Sep'),
  october(10, 'October', 'Oct'),
  november(11, 'November', 'Nov'),
  december(12, 'December', 'Dec');

  final int number;
  final String full;
  final String short;

  const Months(this.number, this.full, this.short);

  static Months fromNumber(int number) {
    return Months.values.firstWhere((month) => month.number == number);
  }
}

enum Weekday {
  monday(1, 'Monday', 'Mon', 'M', Colors.red),
  tuesday(2, 'Tuesday', 'Tue', 'T', Colors.orange),
  wednesday(3, 'Wednesday', 'Wed', 'W', Colors.yellow),
  thursday(4, 'Thursday', 'Thu', 'Th', Colors.green),
  friday(5, 'Friday', 'Fri', 'F', Colors.blue),
  saturday(6, 'Saturday', 'Sat', 'S', Colors.indigo),
  sunday(7, 'Sunday', 'Sun', 'Su', Colors.purple);

  final int value;
  final String fullName;
  final String shortName;
  final String singleLetter;
  final Color color;

  const Weekday(
    this.value,
    this.fullName,
    this.shortName,
    this.singleLetter,
    this.color,
  );

  static Weekday fromValue(int value) {
    return Weekday.values.firstWhere((day) => day.value == value);
  }
}

enum ProspectStatus {
  newProspect(0, 'New Prospect', Colors.blue),
  pursuing(1, 'Pursuing', Colors.green),
  deliberating(2, 'Deliberating', Colors.orange),
  lost(3, 'Lost', Colors.red);

  final int id;
  final String name;
  final Color color;

  const ProspectStatus(this.id, this.name, this.color);

  static ProspectStatus fromId(int id) {
    return ProspectStatus.values.firstWhere((status) => status.id == id);
  }
}

enum DefaultColors {
  pink(0, Colors.pink, Colors.white),
  red(1, Colors.red, Colors.white),
  orange(2, Colors.orange, Colors.white),
  amber(3, Colors.amber, Colors.white),
  yellow(4, Colors.yellow, Colors.black),
  lime(5, Colors.lime, Colors.black),
  green(6, Colors.green, Colors.white),
  teal(7, Colors.teal, Colors.white),
  cyan(8, Colors.cyan, Colors.white),
  blue(9, Colors.blue, Colors.white),
  indigo(10, Colors.indigo, Colors.white),
  purple(11, Colors.purple, Colors.white),
  deepPurple(12, Colors.deepPurple, Colors.white),
  ;

  final int id;
  final Color color;
  final Color textColor;

  const DefaultColors(this.id, this.color, this.textColor);

  static DefaultColors fromId(int id) {
    return DefaultColors.values.firstWhere((color) => color.id == id);
  }
}

enum StudentActivity {
  checkIn('checkIn', 'Check In', Colors.green, FontAwesomeIcons.check, 'in'),
  dropOff('dropOff', 'Drop Off', Colors.green, FontAwesomeIcons.carOn, 'in'),
  pickUp('pickUp', 'Pick Up', Colors.blue, FontAwesomeIcons.carRear, 'out'),
  checkOut('checkOut', 'Check Out', Colors.blue, FontAwesomeIcons.userAstronaut,
      'out'),
  handOff(
      'handOff', 'Hand Off', Colors.purple, FontAwesomeIcons.handshake, 'out'),
  injury('injury', 'Injury', Colors.red, FontAwesomeIcons.userInjured),
  discipline(
      'discipline', 'Discipline', Colors.orange, FontAwesomeIcons.userNinja),
  diaper('diaper', 'Diaper', Colors.pinkAccent, FontAwesomeIcons.baby),
  nap('nap', 'Nap', Colors.purple, FontAwesomeIcons.bed),
  meal('meal', 'Meal', Colors.lightBlue, FontAwesomeIcons.utensils);

  final String id;
  final String title;
  final Color color;
  final IconData icon;
  final String timeLabel;

  const StudentActivity(this.id, this.title, this.color, this.icon,
      [this.timeLabel = 'time']);

  static StudentActivity fromId(String id) {
    return StudentActivity.values.firstWhere((activity) => activity.id == id);
  }

  static StudentActivity fromTitle(String title) {
    return StudentActivity.values
        .firstWhere((activity) => activity.title == title);
  }

  static StudentActivity fromIcon(IconData icon) {
    return StudentActivity.values
        .firstWhere((activity) => activity.icon == icon);
  }
}
