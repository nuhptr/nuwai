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
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/notfound.json',
                repeat: true,
                animate: true,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'Segera Datang',
              style: orangeTextStyle.copyWith(
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
