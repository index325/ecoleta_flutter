class StatesModel {
  final String value;
  final String label;

  StatesModel({
    required this.value,
    required this.label,
  });

  factory StatesModel.fromJson(Map<String, dynamic> statesjson) => StatesModel(
        value: statesjson["sigla"],
        label: statesjson["nome"],
      );
}
