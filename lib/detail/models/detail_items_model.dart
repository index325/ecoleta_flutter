class DetailItemsModel {
  int id;
  String title;
  String image;
  int pointId;
  int itemId;

  DetailItemsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.pointId,
    required this.itemId,
  });

  factory DetailItemsModel.fromJson(Map<String, dynamic> model) =>
      DetailItemsModel(
        id: model['id'],
        title: model['title'],
        image: model['image'],
        pointId: model['point_id'],
        itemId: model['item_id'],
      );
}
