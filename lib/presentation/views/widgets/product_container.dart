import 'package:fake_products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.blue),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Image(
                image: NetworkImage(product.image),
                height: 100,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'EGP ${product.price}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('Review (${product.rating['rate']}) '),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: -3,
            right: -6,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Color(0xFF004087),
                  size: 40,
                ))),
        Positioned(
            top: -3,
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Color(0xFF004087),
                      size: 30,
                    )
                  ],
                ))),
      ],
    );
  }
}
