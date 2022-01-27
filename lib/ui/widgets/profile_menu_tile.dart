import 'package:flutter/material.dart';

import 'package:nuwai/shared/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String? iconUrl;
  final String? title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        width: double.infinity,
        height: 86,
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              iconUrl ?? '',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Text(
              title ?? '',
              style: orangeTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
