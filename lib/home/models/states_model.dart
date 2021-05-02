import 'dart:convert';

class StatesModel {
  final int id;
  final String name;

  StatesModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory StatesModel.fromMap(Map<String, dynamic> map) {
    return StatesModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StatesModel.fromJson(String source) =>
      StatesModel.fromMap(json.decode(source));
}
