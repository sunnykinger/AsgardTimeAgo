import '../relative_time.dart';

class UkraineRelativeTime implements RelativeTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'через';

  @override
  String suffixAgo() => 'тому';

  @override
  String suffixFromNow() => '';

  @override
  String secsAgo(int seconds) => 'хвилину';

  @override
  String minAgo(int minutes) => 'хвилину';

  @override
  String minsAgo(int minutes) => '$minutes ${_convert(minutes, 'minutes')}';

  @override
  String hourAgo(int minutes) => 'годину';

  @override
  String hoursAgo(int hours) => '$hours ${_convert(hours, 'hours')}';

  @override
  String dayAgo(int hours) => 'день';

  @override
  String daysAgo(int days) => '$days ${_convert(days, 'days')}';

  @override
  String aboutAMonth(int days) => 'місяць';

  @override
  String months(int months) => '$months ${_convert(months, 'months')}';

  @override
  String aboutAYear(int year) => 'рік';

  @override
  String years(int years) => '$years ${_convert(years, 'years')}';

  @override
  String wordSeparator() => ' ';

  String _convert(int number, String type) {
    var mod = number % 10;
    var modH = number % 100;

    if (mod == 1 && modH != 11) {
      switch (type) {
        case 'minutes':
          return 'хвилину';
        case 'hours':
          return 'годину';
        case 'days':
          return 'день';
        case 'months':
          return 'місяць';
        case 'years':
          return 'рік';
        default:
          return '';
      }
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      switch (type) {
        case 'minutes':
          return 'хвилини';
        case 'hours':
          return 'години';
        case 'days':
          return 'дні';
        case 'months':
          return 'місяця';
        case 'years':
          return 'роки';
        default:
          return '';
      }
    }
    switch (type) {
      case 'minutes':
        return 'хвилин';
      case 'hours':
        return 'годин';
      case 'days':
        return 'днів';
      case 'months':
        return 'місяців';
      case 'years':
        return 'років';
      default:
        return '';
    }
  }
}
