class Dimensions {
  final double width;
  final double height;
  final double depth;
  Dimensions({required this.depth, required this.height, required this.width});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      depth: (json['depth'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'depth': depth, 'height': height, 'width': width};
  }
}
