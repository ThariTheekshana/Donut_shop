// ignore_for_file: must_be_immutable

import 'package:donuts_shop/util/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  List donutOnSale = [
    // [ donutFlavour, donutPrice, donutColor, imageName]
    ["Ice Cream", "1.6", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "2", Colors.pink, "lib/images/strawberry_donut.png"],
    ["Chocolate", "2", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Grape", "2.6", Colors.purple, "lib/images/grape_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutOnSale.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.61),
        itemBuilder: ((context, index) {
          return DonutTile(
            donutFlavor: donutOnSale[index][0],
            donutPrice: donutOnSale[index][1],
            donutColor: donutOnSale[index][2],
            imageName: donutOnSale[index][3],
          );
        }));
  }
}
