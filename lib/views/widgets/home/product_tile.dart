import 'package:flutter/material.dart';
import 'package:rubiks/constants/constants.dart';
import 'package:rubiks/models/product.dart';


class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Image.network(product.images[0],fit: BoxFit.cover,),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(product.productName,style: Constants.cardTextStyle,),
          const SizedBox(height: 5,),
          Text(product.productType,style: Constants.cardTypeTextStyle,),
          const SizedBox(height: 5,),
          Text('₹${product.price}',style: Constants.cardPriceTextStyle,),],
              ),
                  CircleAvatar(
        backgroundColor: Colors.grey[200],
        radius: 15,
        child: const Icon(Icons.favorite,color: Colors.white,size: 18,),
      )
            ],
          )
        ],
      ),
    );
  }
}