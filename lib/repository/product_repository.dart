import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rubiks/models/product.dart';

final productRepositoryProvider = Provider<ProductRepository>((_)=>ProductRepository());

class ProductRepository {

  final String _ip = 'ip_address';
  final String _port = '3000';
  final _client = http.Client();

  Future<List<Product>> getProducts() async{
    Uri url = Uri.parse("http://$_ip:$_port/api/products");
    var response = await _client.get(url);
    if (response.statusCode==200){
      await Future.delayed(const Duration(seconds: 3));
      return productFromJson(response.body);
    }
    else{
      return [];
    }
  }

}