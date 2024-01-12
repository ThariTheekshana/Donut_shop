import 'package:flutter/material.dart';

class SmoothieTile extends StatefulWidget {
  final String smoothieType;
  final String smoothiePrice;
  final smoothieColor;
  final String smoothieImageName;


  const SmoothieTile(
      {super.key,
      required this.smoothieType,
      required this.smoothiePrice,
      required this.smoothieColor,
      required this.smoothieImageName});

  @override
  State<SmoothieTile> createState() => _SmoothieTileState();
}

class _SmoothieTileState extends State<SmoothieTile> {
  final double borderRadius = 12.0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
              color: widget.smoothieColor[50],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius))),
          child: Column(
            children: [
              // price
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: widget.smoothieColor[100],
                          borderRadius: BorderRadius.circular(borderRadius)),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        '\$${widget.smoothiePrice}',
                        style: TextStyle(
                            color: widget.smoothieColor[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      )),
                ],
              ),
              // donut picture
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 36.0, vertical: 16.0),
                child: Image.asset(widget.smoothieImageName),
              ),

              // donut flavour
              Text(
                widget.smoothieType,
                style: TextStyle(
                  color: widget.smoothieColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 2),

              Text(
                'Dunkins',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),

              // love icon add button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // love Icon
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink[400],
                      ),
                      onPressed: () {},
                    ),

                    // plus Icon
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
