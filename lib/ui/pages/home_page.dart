import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/pages/detail_page.dart';
import 'package:nuwai/ui/widgets/carousel_item.dart';
import 'package:nuwai/ui/widgets/perorangan_tile.dart';
import 'package:nuwai/ui/widgets/perusahaan_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ${state.user.dataUser?.name ?? ''}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Siap mencari pekerjaan?',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          state.user.dataUser?.photoProfile ??
                              'https://www.armandtourandtravel.com/sitepad-data/uploads//2021/02/avatar.jpg',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget carouselPromo() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: CarouselSlider(
          items: [
            CaraouselItem(image: 'assets/image_banner.png'),
            CaraouselItem(image: 'assets/image_banner.png'),
            CaraouselItem(image: 'assets/image_banner2.png'),
          ],
          options: CarouselOptions(
            autoPlay: true,
            height: 190,
            enableInfiniteScroll: false,
            viewportFraction: 0.9,
          ),
        ),
      );
    }

    Widget perusahaan() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: defaultMargin),
            child: Text(
              'Perusahaan',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: defaultMargin),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PerusahaanCard(
                  title: 'Admin Ig',
                  image: 'assets/image_perusahaan1.png',
                  city: 'Pringsewu',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPage()));
                  },
                ),
                PerusahaanCard(
                  title: 'Officer',
                  image: 'assets/image_perusahaan2.png',
                  city: 'Bandarlampung',
                ),
                PerusahaanCard(
                  title: 'Konsultan',
                  image: 'assets/image_perusahaan3.png',
                  city: 'Metro',
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget perorangan() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perorangan',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                PeroranganTile(
                  name: 'Assistant Rumah Tangga',
                  city: 'Pringsewu',
                ),
                PeroranganTile(
                  name: 'Proggramer',
                  city: 'Bandar Lampung',
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      );
    }

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();
        return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            header(),
            carouselPromo(),
            perusahaan(),
            perorangan(),
          ],
        ),
      ),
    );
  }
}
