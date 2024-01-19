import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/plants_provider.dart';
import 'package:provider/provider.dart';

class DetailScreenAppBar extends StatefulWidget {
  const DetailScreenAppBar({super.key, required this.plant});

  final Plant plant;

  @override
  State<DetailScreenAppBar> createState() => _DetailScreenAppBarState();
}

class _DetailScreenAppBarState extends State<DetailScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Constants.primaryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Constants.primaryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  context
                      .read<PlantsProvider>()
                      .toggleFavorite(widget.plant.plantId);
                });
              },
              icon: Icon(
                widget.plant.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
