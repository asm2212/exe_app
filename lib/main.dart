
import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fitness app',
      theme: ThemeData(
      primaryColor: ColorExtension.primaryColor1,
      fontFamily: "Poppins"
      ),
      home: const HomeScreen(),
    );
  }
}
