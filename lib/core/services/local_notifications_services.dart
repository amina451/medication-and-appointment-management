import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tzn;
import 'package:timezone/timezone.dart' as tz;

/// هذا مهم جدًا ليعمل عند غلق التطبيق (entry-point)
@pragma('vm:entry-point')
void onTapBackground(NotificationResponse notificationResponse) {
  LocalNotificationsServices.streamController.add(notificationResponse);
}

class LocalNotificationsServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> init() async {
    // إعداد التوقيت المحلي
    tzn.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // إعداد الإشعارات
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTapBackground,
    );
  }

  /// إشعار مجدول بعد 10 ثوانٍ مع صوت مخصص
  static Future<void> showScheduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'scheduled_channel',
      'Scheduled Notifications',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('android_sound_effect_meme'), // ✅ بدون .mp3
    );

    const NotificationDetails details = NotificationDetails(android: android);

    final scheduledTime =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      'Scheduled Notification',
      'This notification was scheduled 10 seconds ago',
      scheduledTime,
      details,
      payload: 'zonedSchedule',
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  /// إشعار يومي في ساعة ودقيقة محددة مع صوت مخصص
  static Future<void> showDailyScheduledNotification(int hour, int minute) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'daily_channel',
      'Daily Medicine Reminder',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound_notification'),
    );

    const NotificationDetails details = NotificationDetails(android: android);

    final now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Daily Medicine Reminder',
      'This is your daily reminder',
      scheduledTime,
      details,
      payload: 'dailyReminder',
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
