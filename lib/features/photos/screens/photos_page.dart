import 'package:blank_photos/commons/snack_bar_message.dart';
import 'package:blank_photos/features/loading/screens/loading_page.dart';
import 'package:blank_photos/features/photos/components/generate_button.dart';
import 'package:blank_photos/features/photos/components/photos_list.dart';
import 'package:blank_photos/models/photo.dart';
import 'package:blank_photos/providers/loading_provider.dart';
import 'package:blank_photos/providers/photos_provider.dart';
import 'package:blank_photos/services/photos_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  ScrollController scrollController = ScrollController();

  void backToTop() {
    final position = scrollController.position.maxScrollExtent;
    scrollController.jumpTo(position);
  }

  void generatingPhotos() async {
    context.read<Loading>().changeStatus(status: true);

    PhotosService service = PhotosService();
    try {
      List<dynamic>? data = await service.photosRequest();
      if (data != null) {
        List<Photo> photos = service.photosTransform(data);
        _changePhotos(photos);
        _sendNotification(status: true, message: "Photos generated");
      } else {
        _sendNotification(status: false, message: "No photos");
      }
    } catch (e) {
      _sendNotification(status: false, message: "No internet connection");
    }
  }

  void _changePhotos(List<Photo> photos) {
    context.read<Photos>().changeStep(step: 2);
    context.read<Photos>().changePhotos(photos: photos);
  }

  void _sendNotification({required bool status, required String message}) {
    context.read<Loading>().changeStatus(status: false);

    SnackBarMessage snackBarMessage = SnackBarMessage(
      status: status,
      message: message,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarMessage.getSnackBar());
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<Loading>().status
        ? const LoadingPage()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Blank Photos"),
            ),
            body: context.watch<Photos>().step == 1
                ? GenerateButton(
                    action: generatingPhotos,
                  )
                : PhotosList(
                    controller: scrollController,
                  ),
            floatingActionButton: context.watch<Photos>().step == 1
                ? null
                : FloatingActionButton(
                    onPressed: backToTop,
                    child: const Icon(Icons.arrow_upward),
                  ),
          );
  }
}
