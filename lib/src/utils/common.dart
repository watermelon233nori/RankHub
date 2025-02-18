import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class Common {
  static Future<void> futureNavigator<T>(
      {required BuildContext context,
      required Future<T> Function() fetchData,
      required Widget Function(T data) builder}) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Fetch data asynchronously
      final data = await fetchData();

      if (!context.mounted) {
        return;
      }
      // Close the loading dialog
      Navigator.pop(context);

      // Navigate to the desired screen with the fetched data
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => builder(data),
        ),
      );
    } catch (e) {
      // Close the loading dialog in case of an error
      Navigator.pop(context);

      // Show an error dialog or handle the error appropriately
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("Failed to load data: $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  static String formatDateTime(dynamic input, {String? format, Locale? locale}) {
    DateTime? dateTime;

    if (input is DateTime) {
      dateTime = input;
    } else if (input is String) {
      try {
        dateTime = DateTime.parse(input);
      } catch (e) {
        return 'Invalid date format';
      }
    } else {
      return 'Unsupported type';
    }

    if (dateTime.isUtc) {
      dateTime = dateTime.toLocal();
    }

    locale ??= WidgetsBinding.instance.platformDispatcher.locale;
    String localeName = locale.toLanguageTag();

    DateFormat dateFormat;
    if (format != null) {
      dateFormat = DateFormat(format, localeName);
    } else {
      dateFormat = DateFormat.yMMMMd(localeName);
    }

    return dateFormat.format(dateTime);
  }

  static String getCurrentFormattedDate({String? format, Locale? locale}) {
    return formatDateTime(DateTime.now(), format: format, locale: locale);
  }

  static String getTimeAgo(dynamic time, {Locale? locale}) {
    DateTime now = DateTime.now();
    DateTime? past;

    try {
      if (time is DateTime) {
        past = time;
      } else if (time is String) {
        past = DateTime.parse(time);
      } else {
        return 'Unsupported type';
      }
    } catch (e) {
      return 'Invalid date format';
    }

    if (past.isUtc) {
      past = past.toLocal();
    }

    locale ??= WidgetsBinding.instance.platformDispatcher.locale;
    String localeName = locale.toLanguageTag();

    timeago.setLocaleMessages('zh-Hans-CN', timeago.ZhCnMessages());
    return timeago.format(past, locale: localeName, allowFromNow: true, clock: now);
  }
}
