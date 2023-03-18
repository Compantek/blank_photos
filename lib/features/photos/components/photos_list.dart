import 'package:blank_photos/commons/theme.dart';
import 'package:blank_photos/features/photos/components/photo_minimal_information.dart';
import 'package:blank_photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // itemCount: context.watch<Photos>().count,
      itemCount: 25,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: SizesTheme.md,
            bottom: index == 25 - 1 ? SizesTheme.md : 0,
            left: SizesTheme.md,
            right: SizesTheme.md,
          ),
          child: PhotoMinimalInformation(
            photo: context.watch<Photos>().photos[index],
          ),
        );
      },
    );
  }
}
