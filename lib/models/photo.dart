class Photo {
  Photo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.url,
    required this.description,
  });

  final int id;
  final String title;
  final String thumbnailUrl;
  final String url;
  final String description;

  factory Photo.fromJson(Map<String, dynamic> data) {
    return Photo(
      id: data["id"],
      title: data["title"],
      thumbnailUrl: data["thumbnailUrl"],
      url: data["url"],
      description: data["description"],
    );
  }
}
