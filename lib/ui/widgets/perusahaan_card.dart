import 'package:flutter/material.dart';
import 'package:nuwai/shared/theme.dart';

class PerusahaanCard extends StatelessWidget {
  PerusahaanCard({
    Key? key,
    required this.image,
    required this.title,
    this.city,
    this.onPressed,
  }) : super(key: key);

  final String? image;
  final String? title;
  final String? city;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        width: 125,
        height: 166,
        margin: EdgeInsets.only(
          right: 16,
          bottom: 20,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 84,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title ?? '',
              style: orangeTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 3),
            Text(
              city ?? '',
              style: grayTextStyle.copyWith(
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
