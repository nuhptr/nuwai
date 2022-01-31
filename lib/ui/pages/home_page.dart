import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuwai/cubit/work_cubit.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/ui/pages/detail_page.dart';
import 'package:nuwai/ui/widgets/carousel_item.dart';
import 'package:nuwai/cubit/job_individual_cubit.dart';
import 'package:nuwai/cubit/job_perusahaan_cubit.dart';
import 'package:nuwai/ui/widgets/fast_access_menu.dart';
import 'package:nuwai/ui/widgets/perorangan_tile.dart';
import 'package:nuwai/ui/widgets/perusahaan_card.dart';
import 'package:nuwai/ui/widgets/shimmer_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<JobPerusahaanCubit>().getJobByCategory();
    context.read<JobIndividualCubit>().getJobByCategory();
  }

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
                  GestureDetector(
                    onTap: () {
                      context.read<PageCubit>().setPage(2);
                    },
                    child: Container(
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
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: CarouselSlider(
          items: [
            CaraouselItem(image: 'assets/image_banner.png'),
            CaraouselItem(image: 'assets/image_banner3.png'),
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

    Widget fastAccess() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 15,
            ),
            child: Text(
              'Akses Cepat',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                FastAccessMenu(
                  imageUrl: 'assets/icon_notice.png',
                  title: 'Panduan apply pekerjaan',
                  onPressed: () {
                    Navigator.pushNamed(context, '/guide-apply');
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 1.5,
                  decoration: BoxDecoration(
                    color: kGrayColor.withOpacity(0.2),
                  ),
                ),
                FastAccessMenu(
                  imageUrl: 'assets/icon_info.png',
                  title: 'Panduan membuka loker',
                  onPressed: () {
                    Navigator.pushNamed(context, '/guide');
                  },
                ),
              ],
            ),
          ),
        ],
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
          BlocConsumer<JobPerusahaanCubit, JobPerusahaanState>(
            listener: (context, state) {
              if (state is JobPerusahaanFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Gagal ambil data pekerjaan'),
                    backgroundColor: kRedColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is JobPerusahaanSuccess) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: defaultMargin),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.jobModel
                        .map(
                          (jobData) => PerusahaanCard(
                            image: jobData.fotoLowongan,
                            title: jobData.namaPekerjaan,
                            city: jobData.lokasiPekerjaan,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    jobModel: jobData,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        .take(5)
                        .toList(),
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ShimmerContainer(
                  marginBottom: 16,
                  paddingBottom: 20,
                  paddingTop: 20,
                  radius: 10,
                ),
              );
            },
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
            BlocBuilder<JobIndividualCubit, JobIndividualState>(
              builder: (context, state) {
                if (state is JobIndividualSuccess) {
                  return Column(
                    children: state.jobModel
                        .map(
                          (job) => PeroranganTile(
                            name: job.namaPekerjaan,
                            city: job.lokasiPekerjaan,
                            time: job.tenggangWaktuPekerjaan,
                            onPressed: () => DetailPage(jobModel: job),
                          ),
                        )
                        .take(4)
                        .toList(),
                  );
                }
                return ShimmerContainer(
                  marginBottom: 16,
                  paddingBottom: 20,
                  paddingTop: 20,
                  radius: 10,
                );
              },
            ),
            const SizedBox(height: 60),
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
            fastAccess(),
            perusahaan(),
            perorangan(),
          ],
        ),
      ),
    );
  }
}
