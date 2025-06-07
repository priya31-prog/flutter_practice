class UsersModel {
  final int id;
  final String firstName;
  final String lastName;
  final String countryCode;
  final int companyId;

  UsersModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.companyId,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      countryCode: json['countryCode'],
      companyId: json['companyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'countryCode': countryCode,
      'companyId': companyId,
    };
  }
}
