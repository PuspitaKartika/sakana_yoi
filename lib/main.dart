import 'package:flutter/material.dart';
import 'package:sakana_yoi/ui/home_screen.dart';
import 'package:sakana_yoi/ui/navigator_bottom.dart';
import 'package:sakana_yoi/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => NavigatorButton(),
      },
    );
  }
}
