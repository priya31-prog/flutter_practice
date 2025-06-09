class Products {
  final int id;
  final String title;
  final String imageUrl;
  final int price;
  final String description;
  final String brand;
  final String model;
  final String color;
  final String category;
  final int? discount;

  Products({
    required this.brand,
    required this.category,
    required this.color,
    required this.description,
    this.discount,
    required this.id,
    required this.imageUrl,
    required this.model,
    required this.price,
    required this.title,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      brand: json['brand'],
      category: json['category'] ?? '',
      color: json['color'] ?? '',
      discount: json['discount'] ?? 0,
      description: json['description'] ?? '',
      id: json['id'] ?? 0,
      imageUrl: json['image'] ?? '',
      model: json['model'] ?? '',
      price: json['price'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'category': category,
      'color': color,
      'discount': discount,
      'description': description,
      'id': id,
      'image': imageUrl,
      'model': model,
      'price': price,
      'title': title,
    };
  }
}
