class UserInfo {
  final Address address;
  final String mailId;
  final String profileUrl;
  final String userId;
  final String userName;
  UserInfo(
    this.address,
    this.mailId,
    this.profileUrl,
    this.userId,
    this.userName,
  );
}

class Address {
  final String addressLine1;
  final String addressLine2;
  final String altPhoneNo;
  final String landMark;
  final String phnNo;
  final String pincode;

  Address(
    this.addressLine1,
    this.addressLine2,
    this.altPhoneNo,
    this.landMark,
    this.phnNo,
    this.pincode,
  );
}
