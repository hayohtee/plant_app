import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/plants_provider.dart';
import 'package:plant_app/ui/component/plant_item.dart';
import 'package:plant_app/ui/screen/cart/cart_screen_footer.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carts = context.select<PlantsProvider, List<Plant>>(
      (provider) => provider.getSelectedPlants(),
    );

    return Scaffold(
      body: carts.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Cart is empty',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: carts.length,
                      itemBuilder: ((context, index) {
                        final currentPlant = carts[index];
                        return PlantItem(plant: currentPlant);
                      }),
                    ),
                  ),
                  CartScreenFooter(plants: carts),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
    );
  }
}
