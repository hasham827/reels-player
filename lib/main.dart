import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bottom_nav_bar/BottomNavBar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.kSecondaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor:AppColors.kSecondaryColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kSecondaryColor),
        useMaterial3: true,
      ),
      home:  const BottomNavBar(),
    );
  }
}

