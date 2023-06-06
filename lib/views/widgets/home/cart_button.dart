import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
              height: 50,
              width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
        
      ),
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}