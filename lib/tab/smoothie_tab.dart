import 'package:donuts_shop/util/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  List smoothieOnSale = [
    // [ smoothieType, smoothiePrice, smoothieColor, imageName]
    ["Avocado", "0.7", Colors.green, "lib/images/avacado_smoothie.png"],
    ["Carrot", "0.5", Colors.orange, "lib/images/carrot_smoothie.png"],
    ["Apple", "0.7", Colors.pink, "lib/images/apple_smoothie.png"],
    ["Lemon", "0.7", Colors.yellow, "lib/images/lemon_smoothie.png"],
    ["Papaya", "0.7", Colors.purple, "lib/images/papaya_smoothie.png"],
    ["Mango", "0.7", Colors.grey, "lib/images/mangoo_smoothie.png"],
    ["WaterMelon", "0.7", Colors.blue, "lib/images/watermaleon_smoothie.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: smoothieOnSale.length,
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.618),
        itemBuilder: ((context, index) {
          return SmoothieTile(
            smoothieType: smoothieOnSale[index][0],
            smoothiePrice: smoothieOnSale[index][1],
            smoothieColor: smoothieOnSale[index][2],
            smoothieImageName: smoothieOnSale[index][3],
          );
        }));
  }
}
