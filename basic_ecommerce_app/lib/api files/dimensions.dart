class Dimensions {
  final double? width;
  final double? height;
  final double? depth;
  Dimensions({this.depth, this.height, this.width});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      depth: json['depth'] ?? 0.0,
      height: json['height'] ?? 0.0,
      width: json['width'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'depth': depth, 'height': height, 'width': width};
  }
}
