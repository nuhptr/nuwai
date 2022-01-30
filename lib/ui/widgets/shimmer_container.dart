import 'package:flutter/material.dart';
import 'package:nuwai/shared/theme.dart';

class ShimmerContainer extends StatelessWidget {
   ShimmerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: 86,
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color:  kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
    );
  }
}