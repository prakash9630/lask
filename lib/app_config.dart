import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/services/service_locator.dart';

Future<void> appConfig(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NDkHwDl9rjZZZRYPDpGQLI1g8Ehn1XV8W3YeP5UZqpgp9xcN5XRS7aZqgo6XJd3ToPo5jvGrRqke0Cct6ZFCKlH00uX0iurgg";

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
  await Future.wait([Firebase.initializeApp(), serviceLocator()]);
  await dotenv.load(fileName: ".env");

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ProviderScope(child: await builder()));
}

@pragma("vm:entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}
