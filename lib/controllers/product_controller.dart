import 'package:get/state_manager.dart';
import 'package:rubiks/models/product.dart';
import 'package:rubiks/services/remote_services.dart';

class ProductController extends GetxController
{
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  
  var productList = <Product>[].obs;

  void fetchProducts()async{
    var products = await RemoteServices.fetchProducts();
    if (products!=[]){
      productList.value=products;

    }else{
      // ignore: avoid_print
      print("no data");
    }
  }
}