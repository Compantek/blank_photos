import 'package:blank_photos/commons/theme.dart';
import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsTheme.primary,
          elevation: SizesTheme.sm,
        ),
        onPressed: action,
        child: const Text("Generate Photos"),
      ),
    );
  }
}
