import 'package:donuts_shop/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:donuts_shop/pages/wish_list.dart';

class DonutTile extends StatefulWidget {
  final String donutPrice;
  final String donutFlavor;
  final donutColor;
  final String imageName;

  final double borderRadius = 12.0;

  const DonutTile({
    Key? key,
    required this.donutColor,
    required this.donutFlavor,
    required this.donutPrice,
    required this.imageName,
  }) : super(key: key);

  @override
  _DonutTileState createState() => _DonutTileState();
}

class _DonutTileState extends State<DonutTile> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    void toggleAddToWishlist() {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => WishList())));
    }

    if (isFavorite) {
      // Show notification when heart is pressed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.pink[100],
          content: Text(
            'Added to Wishlist',
            style:
                TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
          ),
          action: SnackBarAction(
            label: 'Undo',
            textColor: Colors.grey[800],
            onPressed: () {
              toggleAddToWishlist();
            },
          ),
        ),
      );
    }
  }

  void toggleAddToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.pink[100],
        content: Text(
          'Added to Cart',
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
        action: SnackBarAction(
          label: 'View Cart',
          textColor: Colors.grey[800],
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.donutColor[50],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widget.borderRadius),
            topRight: Radius.circular(widget.borderRadius),
          ),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.donutColor[100],
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '\$${widget.donutPrice}',
                    style: TextStyle(
                      color: widget.donutColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            // donut picture
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 16.0,
              ),
              child: Image.asset(widget.imageName),
            ),
            // donut flavour
            Text(
              widget.donutFlavor,
              style: TextStyle(
                color: widget.donutColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 4),

            Text(
              'Dunkins',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),

            // love icon add button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // love Icon
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.pink[400] : null,
                    ),
                    onPressed: _toggleFavorite,
                  ),

                  // plus Icon
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {
                      toggleAddToCart();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
