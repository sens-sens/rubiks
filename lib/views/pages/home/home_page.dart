import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rubiks/providers/product_provider.dart';
import 'package:rubiks/views/widgets/home/cart_button.dart';
import 'package:rubiks/views/widgets/home/product_tile.dart';
import 'package:rubiks/views/widgets/home/search_bar.dart';

import '../../../constants/constants.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final products = ref.watch(filteredProductProvider);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true ,
        title: const Text("Home",style:TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),),
      ),
      body: products.when(data: (products){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
          children: [
        Row(
          children: const[
            SearchBar(),
            CartButton()
          ],
        ),
        
            Expanded(
              child: MasonryGridView.count(
                    itemCount: products.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    physics: const BouncingScrollPhysics(),
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                "Found",
                                style: Constants.bigBoldTextStyle,
                              ),
                               Text(
                                "${products.length} results",
                                style: Constants.bigBoldTextStyle,
                              ),
                                ],
                              ),
                            ),
                            ProductTile(
                              product:products[index]
                            )
                          ],
                        );
                      }
                      return  ProductTile(
                        product:products[index]
                      );
                    },
                  ),
            )
          ],
              ),
        );
      }, error: (error, stackTrace)=> const Center(child: Text('Failed to load products!'),), loading:()=>const Center(child:CircularProgressIndicator()))
    );
  }
}
