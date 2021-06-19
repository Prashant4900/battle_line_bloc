import 'dart:convert';

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.vImage,
    this.hImage,
    this.images,
    this.prices,
    // this.stock,
    this.categoriesId,
    this.categoriesName,
    this.brandId,
    this.brandName,
    this.brandDescription,
    this.brandLogo,
    this.brandPoster,
    this.brandUrl,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? vImage;
  final String? hImage;
  final List? images;
  final String? prices;
  // final bool? stock;
  final int? categoriesId;
  final String? categoriesName;
  final int? brandId;
  final String? brandName;
  final String? brandDescription;
  final String? brandUrl;
  final String? brandLogo;
  final String? brandPoster;
  final String? publishedAt;
  final String? createdAt;
  final String? updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      description: json["description"],
      vImage: json["vImage"]["url"],
      hImage: json["hImage"]["url"],
      images: json["images"],
      prices: json["price"],
      brandId: json["brand"]["id"],
      brandName: json["brand"]["name"],
      brandDescription: json["brand"]["description"],
      brandUrl: json["brand"]["url"],
      brandPoster: json["brand"]["poster"]["url"],
      brandLogo: json["brand"]["logo"]["url"],
      // stock: json["stock"],
      categoriesId: json["category"]["id"],
      categoriesName: json["category"]["name"],
      publishedAt: json["published_at"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "vImage": vImage,
        "hImage": hImage,
        "images": images,
        "prices": prices,
        // "stock": stock,
        "categoriesId": categoriesId,
        "categoriesName": categoriesName,
        "publishedAt": publishedAt,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

List<ProductModel> productFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productsToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
