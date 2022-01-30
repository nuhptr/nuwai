import 'package:flutter/material.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    Key? key,
    this.marginBottom,
    this.paddingTop,
    this.paddingBottom,
    this.radius,
  }) : super(key: key);

  final double? marginBottom;
  final double? paddingTop;
  final double? paddingBottom;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: double.infinity,
        height: 86,
        margin: EdgeInsets.only(bottom: marginBottom ?? 0),
        padding: EdgeInsets.symmetric(
          vertical: paddingTop ?? 0,
          horizontal: paddingBottom ?? 0,
        ),
        decoration: BoxDecoration(
          color: kGrayColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
    );
  }
}
