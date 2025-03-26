import 'package:flutter/material.dart';

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
