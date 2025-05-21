import 'dart:async';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tzn;
import 'package:timezone/timezone.dart' as tz;

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
    tzn.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTapBackground,
    );
  }




  static Future<void> showScheduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'scheduled_channel',
      'Scheduled Notifications',
      channelDescription: 'Channel for scheduled notifications',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('android_sound_effect_meme'),
    );

    const NotificationDetails details = NotificationDetails(android: android);

    final scheduledTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

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


  static Future<void> showDateNotification(int hour, int minute) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'doctor_channel',
      'Doctor Appointment Reminder',
      channelDescription: 'Channel for doctor appointment reminders',
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

    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      'Rappel de rendez-vous chez le docteur',
      'Vous avez un rendez-vous chez le docteur aujourd\'hui à ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}, merci de ne pas être en retard.',
      scheduledTime,
      details,
      payload: 'doctorAppointment',
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  
  static Future<void> showMedicationNotification(int hour, int minute, String nameMedication) async {
    final AndroidNotificationDetails android = AndroidNotificationDetails(
      'médicaments_quotidiens',
      'Alarme quotidienne de médicaments $nameMedication',
      channelDescription: 'Channel for daily medication reminders',
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

    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      'Daily $nameMedication Reminder',
      'This is your daily reminder for $nameMedication',
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

  /// إشعار فوري للاختبار (اختياري)
  static Future<void> showInstantNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'instant_channel',
      'Instant Notifications',
      channelDescription: 'Channel for instant notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Instant Notification',
      'This is an instant notification',
      details,
      payload: 'instant',
    );
  }
}