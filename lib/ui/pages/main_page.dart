import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/pages/home_page.dart';
import 'package:nuwai/ui/pages/profile_page.dart';
import 'package:nuwai/ui/pages/search_page.dart';
import 'package:nuwai/ui/widgets/custom_buttom_navigation_item.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int? currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return SearchPage();
        case 2:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_nav_home.png',
                index: 0,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_nav_search.png',
                index: 1,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_nav_profile.png',
                index: 2,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (BuildContext context, stateIndex) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(stateIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
