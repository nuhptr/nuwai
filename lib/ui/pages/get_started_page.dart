import 'package:flutter/material.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget background() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 290,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image_started.png'),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_nuwai.png',
                width: 55,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Menulung Guwai\nkan Orang Lampung',
                  textAlign: TextAlign.center,
                  style: orangeTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Membantu anda menemukan\npekerjaan yang ada di Lampung',
                  style: grayTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                title: 'Lanjutkan',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                width: 220,
                margin: EdgeInsets.only(top: 70),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          background(),
          content(),
        ],
      ),
    );
  }
}
