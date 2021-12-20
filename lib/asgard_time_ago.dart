library asgard_time_ago;

import 'package:asgard_time_ago/messages/languages/en_relative_time.dart';
import 'package:asgard_time_ago/messages/languages/ru_relative_time.dart';
import 'package:asgard_time_ago/messages/relative_time.dart';
import 'package:intl/intl.dart';

class AsgardTimeAgo {
  static String _defaultLocale = 'en';

  static final Map<String, RelativeTime> _relativeTimeMap = {
    'en': EnglishRelativeTime(),
    'ru': RussianRelativeTime(),
  };

  /// Sets the default [locale]. By default it is `en`.
  static void setDefaultLocale(String locale) {
    assert(_relativeTimeMap.containsKey(locale),
        '[locale] must be a registered locale');
    _defaultLocale = locale;
  }

  static String format(DateTime date,
      {String? locale, bool allowFromNow = false, String? pattern}) {
    final _locale = locale ?? _defaultLocale;
    if (_relativeTimeMap[_locale] == null) {
      print(
          "Locale [$_locale] has not been added, using [$_defaultLocale] as fallback. To add a locale use [setLocaleMessages]");
    }
    final _allowFromNow = allowFromNow;
    final messages = _relativeTimeMap[_locale] ?? EnglishRelativeTime();
    final _referenceTime = DateTime.now();
    var elapsed =
        _referenceTime.millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    final _pattern = pattern ?? "dd MMM, yyyy hh:mm aa";
    final formattedDate = DateFormat(_pattern).format(date);
    String prefix, suffix;

    if (_allowFromNow && elapsed < 0) {
      elapsed = date.isBefore(_referenceTime) ? elapsed : elapsed.abs();
      prefix = messages.prefixFromNow();
      suffix = messages.suffixFromNow();
    } else {
      prefix = messages.prefixAgo();
      suffix = messages.suffixAgo();
    }

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;

    String result;
    if (seconds < 45) {
      result = messages.secsAgo(seconds.round());
    } else if (seconds < 90) {
      result = messages.minAgo(minutes.round());
    } else if (minutes < 45) {
      result = messages.minsAgo(minutes.round());
    } else if (minutes < 90) {
      result = messages.hourAgo(minutes.round());
    } else if (hours < 24) {
      result = messages.hoursAgo(hours.round());
    } else if (hours < 48) {
      result = messages.dayAgo(hours.round());
    } else if (days < 8) {
      result = messages.daysAgo(days.round());
    } else {
      prefix = '';
      suffix = '';
      result = formattedDate;
    }

    return [prefix, result, suffix]
        .where((str) => str.isNotEmpty)
        .join(messages.wordSeparator());
  }
}
