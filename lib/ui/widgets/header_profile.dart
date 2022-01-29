import 'package:flutter/material.dart';

import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/shared/theme.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
    this.state,
  }) : super(key: key);

  final UserSuccess? state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          margin: EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                state?.user.dataUser?.photoProfile ??
                    'https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs_400x400.jpg',
              ),
            ),
          ),
        ),
        Text(
          state?.user.dataUser?.name ?? 'No Name',
          style: orangeTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          state?.user.dataUser?.email ?? 'No email',
          style: grayTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
