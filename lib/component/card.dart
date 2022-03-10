import 'package:flutter/material.dart';

class DiscoverCard extends StatelessWidget {
  final image;
  final name;
  final price;

  DiscoverCard({this.image, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            width: 170,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(image, height: 200, fit: BoxFit.fill)),
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  'Rs ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(price),
              ],
            ),
          )
        ],
      ),
    );
  }
}
