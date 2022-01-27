import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuwai/shared/theme.dart';

class PeroranganTile extends StatelessWidget {
  PeroranganTile({
    Key? key,
    this.name,
    this.city,
    this.time, this.onPressed,
  }) : super(key: key);

  final String? name;
  final String? city;
  final DateTime? time;
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? 'no name',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    city ?? 'no city',
                    style: grayTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(
                time ?? DateTime.now(),
              ),
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
