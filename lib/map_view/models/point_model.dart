import 'dart:convert';

class PointModel {
  int id;
  String name;
  String address;
  String imageUrl;
  String image;
  double latitude;
  double longitude;

  PointModel({
    required this.id,
    required this.name,
    required this.address,
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
      address: model['address']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
      'address': address
    };
  }

  factory PointModel.fromMap(Map<String, dynamic> map) {
    return PointModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      image: map['image'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());
}
