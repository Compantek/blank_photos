import 'package:blank_photos/commons/constants.dart';
import 'package:blank_photos/commons/theme.dart';
import 'package:blank_photos/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizesTheme.md),
          child: Column(
            children: [
              Text(
                photo.title,
                textAlign: TextAlign.center,
                style: kPrimaryNormalTitleTextStyle,
              ),
              kSpacing,
              Image.network(photo.url),
              kSpacing,
              Text(
                photo.description,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
