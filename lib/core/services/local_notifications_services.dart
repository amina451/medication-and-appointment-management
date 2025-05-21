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
  static Future<void> showDateNotification(int hour, int minute) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'doctor_channel',
      'Doctor Appointment Reminder',
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

    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(
      100000,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId, // معرف ديناميكي
      'Rappel de rendez-vous chez le docteur',
      'Vous avez un rendez-vous chez le docteur aujourd\'hui à ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}, merci de ne pas être en retard.',
      scheduledTime,
      details,
      payload: 'doctorAppointment',
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> shwoMedicationNotification(
    int hour,
    int minute,
    String nameMedication,
  ) async {
    final AndroidNotificationDetails android = AndroidNotificationDetails(
      'médicaments_quotidiens',
      'Alarme quotidienne de médicaments $nameMedication',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound_notification'),
    );

    final NotificationDetails details = NotificationDetails(android: android);

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

    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(
      100000,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId, // معرف ديناميكي
      'Daily Medicine Reminder',
      'This is your daily reminder',
      scheduledTime,
      details,
      payload: 'dailyReminder',
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
