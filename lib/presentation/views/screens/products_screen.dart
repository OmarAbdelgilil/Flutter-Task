import 'package:fake_products/core/service_locator.dart';
import 'package:fake_products/presentation/bloc/products_bloc.dart';
import 'package:fake_products/presentation/bloc/products_event.dart';
import 'package:fake_products/presentation/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductBloc>()..add(FetchProducts()),
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return Center(
                    child: Text(
                      product.title,
                    ),
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
