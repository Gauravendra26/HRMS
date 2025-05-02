import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen UI',
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
