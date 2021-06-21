class CitiesModel {
  final String value;
  final String label;

  CitiesModel({
    required this.value,
    required this.label,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> statesjson) => CitiesModel(
        value: statesjson["nome"],
        label: statesjson["nome"],
      );
}
