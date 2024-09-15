import 'package:fake_products/data/datasources/remote_datasource.dart';
import 'package:fake_products/domain/repositories/product_repository.dart';
import 'package:fake_products/presentation/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepository(remote: RemoteDataSource()));
  getIt.registerFactory<ProductBloc>(
      () => ProductBloc(productRepository: getIt<ProductRepository>()));
}
