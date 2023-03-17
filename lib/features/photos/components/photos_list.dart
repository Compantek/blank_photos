import 'package:blank_photos/features/photos/components/photo_minimal_information.dart';
import 'package:blank_photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // itemCount: context.watch<Photos>().count,
      itemCount: 5,
      itemBuilder: (context, index) {
        return PhotoMinimalInformation(
          photo: context.watch<Photos>().photos[index],
        );
      },
    );
  }
}
