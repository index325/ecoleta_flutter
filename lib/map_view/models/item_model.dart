class ItemModel {
  int id;
  String title;
  String imageUrl;

  ItemModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory ItemModel.fromJson(Map<String, dynamic> model) => ItemModel(
        id: model['id'],
        title: model['title'],
        imageUrl: model['image_url'],
      );
}
