import 'package:blank_photos/commons/constants.dart';
import 'package:blank_photos/commons/theme.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: ColorsTheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: SizesTheme.xxl,
              width: SizesTheme.xxl,
              child: CircularProgressIndicator(
                color: ColorsTheme.light,
                strokeWidth: SizesTheme.sm,
              ),
            ),
            SizedBox(
              height: SizesTheme.lg,
            ),
            Text(
              "Loading",
              style: kLightNormalTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
