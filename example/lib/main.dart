import 'package:example/my_app.dart';
import 'package:example/screens/home/home_view.dart';
import 'package:example/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  debugPrint('main()');
  debugPrint('begin initialization');

  debugPrint('running app (splash)');
  runApp(MyApp(home: SplashScreenView()));

  await Future.delayed(Duration(seconds: 3));

  debugPrint('running app (home)');
  runApp(MyApp(home: HomeView()));
}
