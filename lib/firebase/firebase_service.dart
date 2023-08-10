import 'dart:io';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lask_client/core/routes/app_routes.dart';

class NotificationServices{

  FirebaseMessaging messaging= FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
  void requestNotificationPermission()async{
    NotificationSettings settings =await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
       print("user granted permission");
    }else if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("user granted provisional permission");
    }else{
      // AppSettings.openNotificationSettings();
      print("user denied permission");
    }
  }

  void initLocalNotification(BuildContext context,RemoteMessage message)async{
    var androidInitSettings =  const AndroidInitializationSettings('mipmap/ic_launcher');
    var iosInitSettings = const DarwinInitializationSettings();

    var initializationSetting= InitializationSettings(
        android: androidInitSettings,
        iOS: iosInitSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveBackgroundNotificationResponse: (payload){
       handleMessage(context, message);
      }
    );
  }

   void firebaseInit(BuildContext context){
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
      print(message.data.toString());
      if(Platform.isAndroid){
        initLocalNotification(context, message);
        showNotification(message);
      }else
        {
          showNotification(message);
        }
    });
  }
  Future<void> showNotification(RemoteMessage message)async{
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "high Importance Notificaon",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails= AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channelDescription: "HIgh improtance Notification",
        importance: Importance.high,
        priority: Priority.high,
        icon: 'mipmap/ic_launcher',
        ticker: "ticker");

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true
    );

    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails,
      iOS:  darwinNotificationDetails,
    );
    Future.delayed(Duration.zero,
            (){
          _flutterLocalNotificationsPlugin.show(
              0,
              message.notification!.title.toString(),
              message.notification!.body.toString(),
              notificationDetails);
        });
  }

  Future<String> getDeviceToken()async{
   String? token= await messaging.getToken();
   return token!;
  }

  void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message){
    if(message.data["roomId"]!=null){
      context.router.push(const NotificationRoute());
    }
  }
  // background message handel on is in kill state
  Future<void> setUpInteractMessage(BuildContext context)async{
    // when app is termited
    RemoteMessage? initialMessage= await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage!=null){
      handleMessage(context, initialMessage);

    }
    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });

  }
}