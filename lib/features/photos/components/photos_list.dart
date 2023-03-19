import 'package:blank_photos/commons/theme.dart';
import 'package:blank_photos/features/photos/components/photo_minimal_information.dart';
import 'package:blank_photos/models/photo.dart';
import 'package:blank_photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotosList extends StatefulWidget {
  const PhotosList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  State<PhotosList> createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  late List<Photo> _photos;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _photos = context.watch<Photos>().photos;
  }

  void searchPhotos(String query) {
    final filteredPhotos = context.read<Photos>().photos.where((photo) {
      final photoTitle = photo.title.toLowerCase();
      final input = query.toLowerCase();

      return photoTitle.contains(input);
    }).toList();

    setState(() {
      _photos = filteredPhotos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizesTheme.md,
            vertical: SizesTheme.sm,
          ),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search),
              hintText: "Title filter",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizesTheme.md),
                borderSide: const BorderSide(color: ColorsTheme.primary),
              ),
            ),
            onChanged: searchPhotos,
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: widget.controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _photos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: SizesTheme.md,
                  right: SizesTheme.md,
                  bottom: SizesTheme.sm,
                ),
                child: PhotoMinimalInformation(
                  photo: _photos[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
