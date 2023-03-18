import 'package:blank_photos/commons/constants.dart';
import 'package:blank_photos/commons/theme.dart';
import 'package:blank_photos/features/photos/screens/photo_detail_page.dart';
import 'package:blank_photos/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoMinimalInformation extends StatelessWidget {
  const PhotoMinimalInformation({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SizesTheme.xs,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizesTheme.md),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: SizesTheme.md,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SizesTheme.xl,
              ),
              child: Text(
                photo.title,
                textAlign: TextAlign.center,
                style: kDarkSmallTitleTextStyle,
              ),
            ),
            kSpacing,
            Image.network(photo.thumbnailUrl),
            kSpacing,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsTheme.primary,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailPage(photo: photo),
                  ),
                );
              },
              child: const Text("Check"),
            ),
          ],
        ),
      ),
    );
  }
}
