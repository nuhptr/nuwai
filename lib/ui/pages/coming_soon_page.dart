import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:nuwai/shared/theme.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Lottie.asset(
                'assets/notfound.json',
                fit: BoxFit.cover,
                animate: true,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Segera datang di Playstore',
              style: grayTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
