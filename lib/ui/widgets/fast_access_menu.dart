import 'package:flutter/material.dart';

import 'package:nuwai/shared/theme.dart';

class FastAccessMenu extends StatelessWidget {
  FastAccessMenu({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String? imageUrl;
  final String? title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(
              left: 20,
              right: 15,
              top: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl ?? ''),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title ?? 'No title',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: kGrayColor.withOpacity(0.8),
            ),
          )
        ],
      ),
    );
  }
}
