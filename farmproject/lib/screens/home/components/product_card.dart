// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:farmproject/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Image(
        image: AssetImage(widget.product.image),
        fit: BoxFit.fitWidth,
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(widget.product.name),
              Text(widget.product.name),
            ],
          ),
          Row(
            children: [
              Text(widget.product.name),
              Text(widget.product.name),
            ],
          ),
        ],
      ),
    );
  }
}
