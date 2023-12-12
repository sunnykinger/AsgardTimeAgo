import 'package:flutter_test/flutter_test.dart';

import 'package:asgard_time_ago/asgard_time_ago.dart';

void main() {
  group('AsgardTimeAgo Tests', () {
    setUp(() {
      // Set up any initial configurations if needed
    });

    test('Default locale is English', () {
      expect(AsgardTimeAgo.defaultLocale, 'en');
    });

    test('Setting default locale to a registered locale', () {
      AsgardTimeAgo.setDefaultLocale('ru');
      expect(AsgardTimeAgo.defaultLocale, 'ru');
    });

    test('Setting default locale to an unregistered locale throws error', () {
      expect(() => AsgardTimeAgo.setDefaultLocale('es'), throwsAssertionError);
    });


    test('Formatting date with "a day from now" in English', () {
      AsgardTimeAgo.setDefaultLocale('en');
      var futureDate = DateTime.now().add(const Duration(days: 1,hours: 1));
      var formattedDate = AsgardTimeAgo.format(futureDate, allowFromNow: true);

      // Replace with the expected string based on your logic
      expect(formattedDate, 'a day from now');
    });

    test('Formatting date with "13 days ago" in English', () {
      AsgardTimeAgo.setDefaultLocale('en');
      var futureDate = DateTime.now().subtract(const Duration(days: 13));
      var formattedDate = AsgardTimeAgo.format(futureDate, allowFromNow: false, extendedTime: true);

      // Replace with the expected string based on your logic
      expect(formattedDate, '13 days ago');
    });

    test('Formatting date with "13 days ago" in English', () {
      AsgardTimeAgo.setDefaultLocale('en');
      var futureDate = DateTime.now().add(const Duration(days: 13));
      var formattedDate = AsgardTimeAgo.format(futureDate, allowFromNow: false, extendedTime: true);

      // Replace with the expected string based on your logic
      expect(formattedDate, '13 days ago');
    });
  });
}
