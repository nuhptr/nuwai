import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/ui/pages/edit_profile_page.dart';
import 'package:nuwai/ui/widgets/header_profile.dart';
import 'package:nuwai/ui/widgets/profile_menu_tile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Gagal ambil data'),
                backgroundColor: kRedColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserSuccess) {
            return HeaderProfile(
              state: state,
            );
          }
          return HeaderProfile();
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: ListView(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 70,
          ),
          children: [
            header(),
            ProfileMenuItem(
              iconUrl: 'assets/icon_profil.png',
              title: 'Ubah Profil',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => EditProfil()),
                  ),
                );
              },
            ),
            ProfileMenuItem(
              iconUrl: 'assets/icon_star.png',
              title: 'Beri Rating',
              onPressed: () {
                Navigator.pushNamed(context, '/coming-soon');
              },
            ),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Gagal keluar aplikasi'),
                      backgroundColor: kRedColor,
                    ),
                  );
                } else if (state is UserInitial) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/sign-in',
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                if (state is UserSuccess) {
                  return ProfileMenuItem(
                    iconUrl: 'assets/icon_sign_out.png',
                    title: 'Keluar',
                    onPressed: () {
                      context
                          .read<UserCubit>()
                          .logout(token: state.user.userToken);
                    },
                  );
                } else {
                  return ProfileMenuItem(
                    iconUrl: 'assets/icon_sign_out.png',
                    title: 'Keluar',
                    onPressed: () {},
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
