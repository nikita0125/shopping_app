import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color productCardColor;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.productCardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: productCardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: //GoogleFonts.lato(
                Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(
            height: 5,
          ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          // Image(image: AssetImage(image),
          // height: 200,),
          Center(child: Image.asset(image, height: 200)),
        ],
      ),
    );
  }
}
