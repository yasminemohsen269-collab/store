import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.product, super.key});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductScreen.id,
          arguments: product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(1, 1),
                  color: Colors.grey.withOpacity(0.2),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0, 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 170, 162, 162),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${product.price}"),
                        Icon(Icons.favorite_sharp, color: Colors.red, size: 28),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: -60,
            child: Hero(
              tag: product.id,
              child: Image.network(product.image, width: 100, height: 100),
            ),
          ),
        ],
      ),
    );
  }
}
