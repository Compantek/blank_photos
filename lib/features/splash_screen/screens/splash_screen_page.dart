import 'dart:async';

import 'package:blank_photos/commons/constants.dart';
import 'package:blank_photos/commons/theme.dart';
import 'package:blank_photos/features/photos/screens/photos_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const PhotosPage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: ColorsTheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Blank Photos",
              textAlign: TextAlign.center,
              style: kLightBigTitleTextStyle,
            ),
            kSpacing,
            Icon(
              Icons.photo,
              size: SizesTheme.xxl,
              color: ColorsTheme.light,
            ),
          ],
        ),
      ),
    );
  }
}
