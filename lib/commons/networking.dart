class Networking {
  static const String _baseUrl = "jsonplaceholder.typicode.com";

  static Uri getUrl({required String endpoint}) {
    return Uri.https(_baseUrl, endpoint);
  }
}
