
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rubiks/models/product.dart';
import 'package:rubiks/repository/product_repository.dart';

final productProvider = FutureProvider<List<Product>>((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return productRepository.getProducts();
});

final filterProvider = StateProvider((ref) => '');

final filteredProductProvider = FutureProvider<List<Product>>((ref){
  final filter = ref.watch(filterProvider);
  final products = ref.watch(productProvider);

  if (!products.hasValue) {
    return ref.watch(productProvider.future);
  }
  return products.value!.where((element) => element.productName.toLowerCase().contains(filter.toLowerCase())).toList();
});