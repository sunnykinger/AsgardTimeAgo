abstract class RelativeTime {
  String prefixAgo();

  String prefixFromNow();

  String suffixAgo();

  String suffixFromNow();

  /// When time is less than a minute
  String secsAgo(int seconds);

  /// When time is about a minute
  String minAgo(int minutes);

  /// When time is in minutes
  String minsAgo(int minutes);

  /// When time is about an hour
  String hourAgo(int minutes);

  /// When time is in hours
  String hoursAgo(int hours);

  /// When time is a day
  String dayAgo(int hours);

  /// When time is in days
  String daysAgo(int days);

  /// Format when time is about a month
  String aboutAMonth(int days);

  /// Format when time is in months
  String months(int months);

  /// Format when time is about a year
  String aboutAYear(int year);

  /// Format when time is about a year
  String years(int years);

  String wordSeparator() => ' ';
}
