import 'package:flutter/material.dart';

class CaraouselItem extends StatelessWidget {
  CaraouselItem({Key? key, required this.image}) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
