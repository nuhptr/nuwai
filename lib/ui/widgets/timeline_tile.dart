import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:nuwai/shared/theme.dart';

class TimeLineTile extends StatelessWidget {
  const TimeLineTile({
    Key? key,
    this.text,
    this.isBeforeLine,
    this.isAfterLine,
    this.isFirst,
    this.isLast,
  }) : super(key: key);

  final String? text;
  final bool? isBeforeLine;
  final bool? isAfterLine;
  final bool? isFirst;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      endChild: Container(
        child: Text(
          text ?? '',
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        margin: EdgeInsets.only(left: 20, top: 20),
      ),
      indicatorStyle: isFirst == true
          ? IndicatorStyle(color: kBlackColor, width: 15)
          : IndicatorStyle(color: kPrimaryColor, width: 15),
      beforeLineStyle: isBeforeLine == true
          ? LineStyle(
              thickness: 3,
              color: kGrayColor.withOpacity(0.3),
            )
          : LineStyle(),
      afterLineStyle: isAfterLine == true
          ? LineStyle(
              thickness: 3,
              color: kGrayColor.withOpacity(0.3),
            )
          : LineStyle(),
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
    );
  }
}
