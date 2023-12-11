import 'package:asgard_time_ago/messages/relative_time.dart';

class EnglishRelativeTime implements RelativeTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'ago';

  @override
  String suffixFromNow() => 'from now';

  @override
  String secsAgo(int seconds) => '$seconds seconds';

  @override
  String minAgo(int minutes) => 'a minute';

  @override
  String minsAgo(int minutes) => '$minutes minutes';

  @override
  String hourAgo(int minutes) => 'an hour';

  @override
  String hoursAgo(int hours) => '$hours hours';

  @override
  String dayAgo(int hours) => 'a day';

  @override
  String daysAgo(int days) => '$days days';

  @override
  String aboutAMonth(int days) => 'about a month';

  @override
  String months(int months) => '$months months';

  @override
  String aboutAYear(int year) => 'about a year';

  @override
  String years(int years) => '$years years';

  @override
  String wordSeparator() => ' ';
}
