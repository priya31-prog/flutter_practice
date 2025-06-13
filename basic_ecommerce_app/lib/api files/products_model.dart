import 'package:basic_ecommerce_app/api%20files/dimensions.dart';
import 'package:basic_ecommerce_app/api%20files/meta_data.dart';
import 'package:basic_ecommerce_app/api%20files/reviews.dart';

class Products {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercent;
  final double rating;
  final int stock;
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
      price: (json['price'] as num).toDouble(),
      discountPercent: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags']),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'],
      dimension: Dimensions.fromJson(json['dimensions']),
      warrentyInfo: json['warrantyInformation'] ?? '',
      shippingInfo: json['shippingInformation'] ?? '',
      availabiltySts: json['availabilityStatus'] ?? '',
      reviews:
          json['reviews'] != null
              ? (json['reviews'] as List<dynamic>)
                  .map((e) => Reviews.fromJson(e))
                  .toList()
              : null,
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: MetaData.fromJson(json['meta']),
      images: List<String>.from(json['images']),
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
      'dimensions': dimension.toJson(),
      'warrantyInformation': warrentyInfo,
      'shippingInformation': shippingInfo,
      'availabilityStatus': availabiltySts,
      'reviews': reviews!.map((e) => e.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}
