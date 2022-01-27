import 'package:flutter/material.dart';

import 'package:nuwai/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.textEditingController,
    this.inputType = TextInputType.none,
    this.suffixIcon,
    this.obscureText = false,
    this.endForm = false,
    this.isEnable = true,
  }) : super(key: key);

  final String? title;
  final String? hintText;
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? endForm;
  final TextEditingController? textEditingController;
  final bool? isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: endForm == true
          ? EdgeInsets.only(bottom: 30)
          : EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            enabled: isEnable,
            cursorColor: kBlackColor,
            autofocus: false,
            keyboardType: inputType,
            controller: textEditingController,
            obscureText: obscureText!,
            decoration: InputDecoration(
              hintText: hintText ?? '',
              hintStyle: grayTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: kGrayColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
