import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuwai/shared/theme.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/get-started');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 100,
              margin: EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo_nuwai.png'),
                ),
              ),
            ),
            Text(
              'NUWAI',
              style: blackTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
                letterSpacing: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
