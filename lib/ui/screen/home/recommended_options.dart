import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class RecommendedOptions extends StatelessWidget {
  const RecommendedOptions({
    super.key,
    required this.selectedIndex,
    required this.options,
    required this.onSelect,
  });

  final List<String> options;
  final int selectedIndex;
  final void Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: options.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              onSelect(index);
            },
            child: Text(
              options[index],
              style: TextStyle(
                fontSize: 16.0,
                fontWeight:
                    selectedIndex == index ? FontWeight.bold : FontWeight.w300,
                color: selectedIndex == index
                    ? Constants.primaryColor
                    : Constants.blackColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
