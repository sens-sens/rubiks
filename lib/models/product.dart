import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    final int id;
    final String productName;
    final String description;
    final String productType;
    final int price;
    final List<String> images;


    Product({
        required this.id,
        required this.productName,
        required this.price,
        required this.productType,
        required this.description,
        required this.images,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["product_name"],
        description: json["description"],
        price: json["price"],
        productType: json["product_type"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "description":description,
        "product_type":productType,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}