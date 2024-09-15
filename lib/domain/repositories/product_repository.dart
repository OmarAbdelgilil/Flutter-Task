import 'package:fake_products/data/datasources/remote_datasource.dart';
import 'package:fake_products/data/models/product_model.dart';

class ProductRepository {
  final RemoteDataSource remote;

  ProductRepository({required this.remote});

  Future<List<Product>> getProducts() async {
    try {
      return await remote.fetchProducts();
    } catch (e) {
      throw Exception('Error fetching Products');
    }
  }
}
