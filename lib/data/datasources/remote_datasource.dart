import 'dart:convert';
import 'package:fake_products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load Products');
    }
  }
}
