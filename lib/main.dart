import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sakana_yoi/ui/home_screen.dart';
import 'package:sakana_yoi/ui/indikator/detail_aliran_air.dart';
import 'package:sakana_yoi/ui/indikator/detail_indikator.dart';
import 'package:sakana_yoi/ui/indikator/detail_suhu_air.dart';
import 'package:sakana_yoi/ui/indikator/detail_tinggi_air.dart';
import 'package:sakana_yoi/ui/navigator_bottom.dart';
import 'package:sakana_yoi/ui/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/detailIndikator': (context) => DetailIndikator(),
        '/suhuAir': (context) => DetailSuhuAir(),
        '/tinggiAir': (context) => DetailTinggiAir(),
        '/aliranAir': (context) => DetailAliranAir(),
      },
    );
  }
}
