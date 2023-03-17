import 'package:blank_photos/commons/theme.dart';
import 'package:blank_photos/features/splash_screen/screens/splash_screen_page.dart';
import 'package:blank_photos/providers/loading_provider.dart';
import 'package:blank_photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Photos()),
        ChangeNotifierProvider(create: (_) => Loading()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blank Photos',
      theme: ThemeData(
        primaryColor: ColorsTheme.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsTheme.primary,
          centerTitle: true,
        ),
      ),
      home: const SplashScreenPage(),
    );
  }
}
