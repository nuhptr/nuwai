import 'package:flutter/material.dart';

import 'package:nuwai/shared/theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.isLoading = false,
    this.isApply,
  }) : super(key: key);

  final String? title;
  final double? width;
  final Function()? onPressed;
  final EdgeInsets? margin;
  final bool? isLoading;
  final String? isApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 55,
      child: TextButton(
        onPressed: isApply == 'True' ? () {} : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isApply == 'True' ? kGrayColor : kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading == true
            ? CircularProgressIndicator(
                strokeWidth: 2,
                color: kWhiteColor,
              )
            : Text(
                title ?? '',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
      ),
    );
  }
}
