import 'package:flutter/material.dart';
import 'package:food_pos/core/theme/app_theme.dart';
import 'package:food_pos/presentation/screens/home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MaterialApp(
        title: 'Food POS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        home: const Home(),
      ),
    );
  }
}
