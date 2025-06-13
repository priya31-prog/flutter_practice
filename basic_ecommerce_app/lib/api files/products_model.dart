class Products {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercent;
  final double rating;
  final double stock;
  final List<String> tags;
  final String sku;
  final int weight;
  final Dimensions dimension;
  final String warrentyInfo;
  final String shippingInfo;
  final String availabiltySts;
  final List<Reviews>? reviews;
  final String brand;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final MetaData meta;
  final List<String>? images;
  final String thumbnail;

  Products({
    required this.brand,
    required this.category,
    required this.availabiltySts,
    required this.discountPercent,
    this.reviews,
    required this.dimension,
    // required this.color,
    required this.description,
    // this.discount,
    required this.id,
    // required this.imageUrl,
    // required this.model,
    required this.price,
    required this.title,
    required this.rating,
    required this.shippingInfo,
    required this.sku,
    required this.stock,
    required this.tags,
    required this.warrentyInfo,
    required this.weight,
    required this.meta,
    required this.minimumOrderQuantity,
    required this.returnPolicy,
    required this.thumbnail,
    this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? 0.0,
      discountPercent: json['discountPercentage'] ?? 0.0,
      rating: json['rating'] ?? 0.0,
      stock: json['stock'] ?? 0.0,
      tags: json['tags'],
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'] ?? 0,
      dimension: json['dimensions'],
      warrentyInfo: json['warrantyInformation'] ?? '',
      shippingInfo: json['shippingInformation'] ?? '',
      availabiltySts: json['availabilityStatus'] ?? '',
      reviews: json['reviews'],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: json['meta'],
      images: json['images'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'category': category,
      'description': description,
      'id': id,
      'price': price,
      'title': title,
      'discountPercentage': discountPercent,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'sku': sku,
      'weight': weight,
      'dimensions': dimension,
      'warrantyInformation': warrentyInfo,
      'shippingInformation': shippingInfo,
      'availabilityStatus': availabiltySts,
      'reviews': reviews,
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta,
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}

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

class Reviews {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerMail;

  Reviews({
    this.comment,
    this.date,
    this.rating,
    this.reviewerMail,
    this.reviewerName,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      comment: json['comment'] ?? 0,
      date: json['date'] ?? '',
      rating: json['rating'] ?? '',
      reviewerMail: json['reviewerEmail'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'date': date,
      'rating': rating,
      'reviewerEmail': reviewerMail,
      'reviewerName': reviewerName,
    };
  }
}

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
