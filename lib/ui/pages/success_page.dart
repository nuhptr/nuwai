import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nuwai/shared/theme.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Lottie.asset(
                    'assets/success.json',
                    repeat: true,
                    animate: true,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text('Kamu Berhasil\nMelamar Hurray',
                  textAlign: TextAlign.center,
                  style: orangeTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
