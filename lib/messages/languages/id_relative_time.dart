import 'package:asgard_time_ago/messages/relative_time.dart';

class IndonesianRelativeTime implements RelativeTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'yang lalu';

  @override
  String suffixFromNow() => 'dari sekarang';

  @override
  String secsAgo(int seconds) => 'kurang dari semenit';

  @override
  String minAgo(int minutes) => 'semenit';

  @override
  String minsAgo(int minutes) => '$minutes menit';

  @override
  String hourAgo(int minutes) => 'sekitar sejam';

  @override
  String hoursAgo(int hours) => '$hours jam';

  @override
  String dayAgo(int hours) => 'sehari';

  @override
  String daysAgo(int days) => '$days hari';

  @override
  String aboutAMonth(int days) => 'sekitar sebulan';

  @override
  String months(int months) => '$months bulan';

  @override
  String aboutAYear(int year) => 'sekitar setahun';

  @override
  String years(int years) => '$years tahun';

  @override
  String wordSeparator() => ' ';
}
