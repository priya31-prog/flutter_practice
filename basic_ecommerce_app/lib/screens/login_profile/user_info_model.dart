class UserInfoModel {
  final Address? address;
  final String? mailId;
  final String? profileUrl;
  String? userId;
  final String? userName;
  UserInfoModel({
    this.address,
    this.mailId,
    this.profileUrl,
    this.userId,
    this.userName,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      mailId: json['mail_id'] ?? '',
      profileUrl: json['profile_url'] ?? '',
      userId: json['user_id'] ?? '',
      userName: json['user_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address?.toJson(),
      'mailId': mailId,
      'profile_url': profileUrl,
      'user_id': userId,
      'user_name': userName,
    };
  }
}

class Address {
  final String? addressLine1;
  final String? addressLine2;
  final String? altPhoneNo;
  final String? landMark;
  final String? phnNo;
  final String? pincode;

  Address({
    this.addressLine1,
    this.addressLine2,
    this.altPhoneNo,
    this.landMark,
    this.phnNo,
    this.pincode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressLine1: json['address_line1'] ?? '',
      addressLine2: json['address_line2'] ?? '',
      altPhoneNo: json['alternate_phone'] ?? '',
      landMark: json['land_mark'] ?? '',
      phnNo: json['phone_number'] ?? '',
      pincode: json['pincode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'alternate_phone': altPhoneNo,
      'land_mark': landMark,
      'phone_number': phnNo,
      'pincode': pincode,
    };
  }
}
