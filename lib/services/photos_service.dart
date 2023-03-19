import 'dart:convert';
import 'dart:math';

import 'package:blank_photos/commons/networking.dart';
import 'package:blank_photos/models/photo.dart';
import 'package:http/http.dart' as http;
import 'package:ipsum/ipsum.dart';

class PhotosService {
  final _url = Networking.getUrl(endpoint: "/photos");

  Future<List<dynamic>?> photosRequest() async {
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }

  List<Photo> photosTransform(List<dynamic> data) {
    List<Photo> photos = [];

    for (var d in data) {
      d["description"] = Ipsum().sentences(Random().nextInt(2) + 3);
      Photo photo = Photo.fromJson(d);
      photos.add(photo);
    }

    return photos;
  }
}
