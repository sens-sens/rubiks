import 'package:http/http.dart' as http;
import 'package:rubiks/models/product.dart';

class RemoteServices {

  //Declaration
  static String ip = '192.168.120.207';
  static String port = '80';
  static var client = http.Client();

  //Functions
  static Future<List<Product>> fetchProducts() async{
    Uri url = Uri.parse("http://$ip:$port/api/products");
    var response = await client.get(url);
    if (response.statusCode==200){
      return productFromJson(response.body);
    }
    else{
      return [];
    }
  }
}