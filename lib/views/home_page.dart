import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rubiks/components/custom_tile.dart';
import 'package:rubiks/controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
        centerTitle: true ,
        title: const Text("Search products",style:TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),),
      
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.amber,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            )),

          Expanded(
            child: Obx(() => MasonryGridView.count(
                  itemCount: productController.productList.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text(
                            "Found",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                           Text(
                            "${productController.productList.length} results",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          CustomGridTile(
                            product:productController.productList[index]
                          )
                        ],
                      );
                    }
                    return  CustomGridTile(
                      product:productController.productList[index]
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
