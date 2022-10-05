// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:farmproject/models/product_model.dart';
import 'package:farmproject/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchBarController = TextEditingController();

  List<Product> demoProducts = [
    Product(
        name: 'Maize',
        ros: 10,
        costPerIncome: 10,
        description: 'fresh maize from the farm. Correct and nice',
        endDate: '12-12-2022',
        image: 'assets/images/maize.jpg',
        startDate: '12-09-2022',
        status: 'available'),
    Product(
        name: 'Maize',
        ros: 10,
        costPerIncome: 10,
        description: 'fresh maize from the farm. Correct and nice',
        endDate: '12-12-2022',
        image: 'assets/images/maize.jpg',
        startDate: '12-09-2022',
        status: 'available'),
    Product(
        name: 'Maize',
        ros: 10,
        costPerIncome: 10,
        description: 'fresh maize from the farm. Correct and nice',
        endDate: '12-12-2022',
        image: 'assets/images/maize.jpg',
        startDate: '12-09-2022',
        status: 'available'),
    Product(
        name: 'Maize',
        ros: 10,
        costPerIncome: 10,
        description: 'fresh maize from the farm. Correct and nice',
        endDate: '12-12-2022',
        image: 'assets/images/maize.jpg',
        startDate: '12-09-2022',
        status: 'available'),
    Product(
        name: 'Maize',
        ros: 10,
        costPerIncome: 10,
        description: 'fresh maize from the farm. Correct and nice',
        endDate: '12-12-2022',
        image: 'assets/images/maize.jpg',
        startDate: '12-09-2022',
        status: 'available'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('Search'),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ...List.generate(
              demoProducts.length,
              (index) => ProductCard(
                product: demoProducts[index],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
