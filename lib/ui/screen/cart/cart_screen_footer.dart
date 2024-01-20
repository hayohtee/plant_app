import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';

class CartScreenFooter extends StatelessWidget {
  const CartScreenFooter({
    super.key,
    required this.plants,
  });

  final List<Plant> plants;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Totals',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '\$${_computePrice()}',
              style: const TextStyle(
                fontSize: 24,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }

  int _computePrice() {
    return plants
        .map((e) => e.price)
        .reduce((value, element) => value + element);
  }
}
