import 'package:flutter/material.dart';
import 'package:rubiks/models/product.dart';


class CustomGridTile extends StatelessWidget {
  final Product product;
  const CustomGridTile({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.red,
      child: Column(
        children: [
          Text(product.productName),
          Text('${product.productId}'),
          Text('${product.price}'),
        ],
      ),
    );
  }
}