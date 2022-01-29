import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/cubit/user_cubit.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/profile_menu_tile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(state.user.dataUser?.photoProfile ?? ''),
                    ),
                  ),
                ),
                Text(
                  state.user.dataUser?.name ?? 'No Name',
                  style: orangeTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  state.user.dataUser?.email ?? '',
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
          } else {
            return SizedBox();
          }
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
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 50,
          ),
          children: [
            header(),
            ProfileMenuItem(
              iconUrl: 'assets/icon_profil.png',
              title: 'Ubah Profil',
              onPressed: () {
                Navigator.pushNamed(context, '/edit');
              },
            ),
            ProfileMenuItem(
              iconUrl: 'assets/icon_book.png',
              title: 'Panduan Membuka Lowongan',
              onPressed: () {
                Navigator.pushNamed(context, '/guide');
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
                      content: Text(state.message),
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
                if (state is UserLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

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
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
