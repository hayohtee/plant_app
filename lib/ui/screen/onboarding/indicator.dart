import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.currentIndex,
    required this.size,
  });

  final int currentIndex;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        size,
        (index) => IndicatorItem(isActive: index == currentIndex),
      ),
    );
  }
}

class IndicatorItem extends StatelessWidget {
  const IndicatorItem({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      height: 10,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: const BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
