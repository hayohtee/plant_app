import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({super.key, required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const SizedBox(
                  height: 60,
                  width: 60,
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 80,
                  child: Image.asset(plant.imageURL),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plant.category),
                    Text(
                      plant.plantName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '\$${plant.price}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Constants.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
