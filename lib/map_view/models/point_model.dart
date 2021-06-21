class PointModel {
  int id;
  String name;
  String imageUrl;
  String image;
  double latitude;
  double longitude;

  PointModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  factory PointModel.fromJson(Map<String, dynamic> model) => PointModel(
        id: model['id'],
        name: model['name'],
        imageUrl: model['image_url'],
        latitude: model['latitude'],
        longitude: model['longitude'],
        image: model['image'],
      );
}
