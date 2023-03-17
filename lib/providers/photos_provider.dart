import 'package:flutter/material.dart';
import 'package:blank_photos/models/photo.dart';

class Photos with ChangeNotifier {
  List<Photo> _photos = [];
  int _count = 0;
  int _step = 1;

  List<Photo> get photos => _photos;
  int get count => _count;
  int get step => _step;

  void changePhotos({required List<Photo> photos}) {
    _photos = photos;
    notifyListeners();

    changeCount(count: _photos.length);
  }

  void changeCount({required int count}) {
    _count = count;
    notifyListeners();
  }

  void changeStep({required int step}) {
    _step = step;
    notifyListeners();
  }
}
