library asgard_time_ago;

import 'package:asgard_time_ago/messages/languages/en_relative_time.dart';
import 'package:asgard_time_ago/messages/languages/id_relative_time.dart';
import 'package:asgard_time_ago/messages/languages/ru_relative_time.dart';
import 'package:asgard_time_ago/messages/languages/uk_relative_time.dart';
import 'package:asgard_time_ago/messages/relative_time.dart';
import 'package:intl/intl.dart';

class AsgardTimeAgo {
  static String _defaultLocale = 'en';

  static final Map<String, RelativeTime> _relativeTimeMap = {
    'en': EnglishRelativeTime(),
    'ru': RussianRelativeTime(),
    'id': IndonesianRelativeTime(),
    'uk': UkraineRelativeTime(),
  };

  /// Sets the default [locale]. By default it is `en`.
  static void setDefaultLocale(String locale) {
    assert(_relativeTimeMap.containsKey(locale),
        '[locale] must be a registered locale');
    _defaultLocale = locale;
  }

  static String format(DateTime date, {String? locale, bool allowFromNow = false, DateFormat? formatter, bool extendedTime=false}) {
    final _locale = locale ?? _defaultLocale;
    if (_relativeTimeMap[_locale] == null) {
      print("Locale [$_locale] has not been added, using [$_defaultLocale] as fallback. To add a locale use [setLocaleMessages]");
    }
    return _formatHelper(date, _locale, allowFromNow, formatter, extendedTime);
  }

  static String _formatHelper(DateTime date, String locale, bool allowFromNow, DateFormat? formatter, bool showExtended) {
    final messages = _relativeTimeMap[locale] ?? EnglishRelativeTime();
    final DateTime _referenceTime = DateTime.now();
    var elapsed = _referenceTime.millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    final formattedDate = formatter == null ? DateFormat.yMMMd().add_jm().format(date) : formatter.format(date);
    String prefix, suffix;
    if (allowFromNow && elapsed < 0) {
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
    final num months = days / 30;
    final num years = days / 365;

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
    } else if (days < 8 && !showExtended) {
      result = messages.daysAgo(days.round());
    } else if (showExtended && months < 12) {
      result = months < 2 ? messages.aboutAMonth(months.round()) : messages.months(months.round());
    } else if (showExtended) {
      result = years < 2 ? messages.aboutAYear(years.round()) : messages.years(years.round());
    } else {
      prefix = '';
      suffix = '';
      result = formattedDate;
    }

    return [prefix, result, suffix].where((str) => str.isNotEmpty).join(messages.wordSeparator());
  }

}




