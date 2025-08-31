class StateModel {
  final String name;
  final String code;
  final String pincodeRange;
  StateModel({
    required this.name,
    required this.code,
    required this.pincodeRange,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      pincodeRange: json['pincode_range'] ?? '',
    );
  }
}
