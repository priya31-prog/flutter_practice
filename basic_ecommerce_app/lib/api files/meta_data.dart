class MetaData {
  final String? createdAt;
  final String? updatedAt;
  final String? barCode;
  final String? qrCode;

  MetaData({this.createdAt, this.barCode, this.qrCode, this.updatedAt});

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      barCode: json['barcode'] ?? '',
      qrCode: json['qrCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barCode,
      'qrCode': qrCode,
    };
  }
}
