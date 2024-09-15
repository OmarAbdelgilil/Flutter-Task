import 'package:fake_products/domain/repositories/product_repository.dart';
import 'package:fake_products/presentation/bloc/products_event.dart';
import 'package:fake_products/presentation/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductLoading()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await productRepository.getProducts();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
