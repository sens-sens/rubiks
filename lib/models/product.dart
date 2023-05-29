import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.productId,
        required this.productName,
        required this.price,
    });

    int productId;
    String productName;
    int price;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["ProductId"],
        productName: json["ProductName"],
        price: json["Price"],
    );

    Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "ProductName": productName,
        "Price": price,
    };
}