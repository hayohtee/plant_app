import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';

class DetailScreenFooter extends StatelessWidget {
  const DetailScreenFooter({super.key, required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.plantName,
                        style: const TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${plant.price}',
                        style: const TextStyle(
                          color: Constants.blackColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        plant.rating.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Constants.primaryColor,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        size: 30,
                        color: Constants.primaryColor,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  plant.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: Constants.blackColor.withOpacity(0.7),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
