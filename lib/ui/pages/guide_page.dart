import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/timeline_tile.dart';

class GuidePage extends StatelessWidget {
  GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.read<PageCubit>().setPage(0);
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            Image.asset(
              'assets/logo_nuwai.png',
              width: 48,
              fit: BoxFit.cover,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        height: 650,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cara Membuka \nLowongan',
              style: orangeTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
            TimeLineTile(
              text:
                  'Hubungi no.wa 089674135843\nhal ini bertujuan untuk menghindari pembukaan lowongan yang bersifat palsu.',
              isFirst: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text:
                  'Sertakan KTP, dan data-data\npekerjaan yang bisa dilihat di halaman detail pekerjaan.',
              isBeforeLine: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text: 'Untuk gaji boleh dicantumkan \natau tidak.',
              isBeforeLine: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text:
                  'Pekerjaan bersifat halal, dan tidak terpaku dengan bulanan / tetap, contoh : Pencuci Piring untuk 2 Jam.',
              isBeforeLine: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text:
                  'Dengan membaca point 1-4 anda menyetujui persyaratan dan persetujuan kami.',
              isBeforeLine: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text: 'Selamat mencari jasa~ jika ada keluhan sampaikan saja.',
              isLast: true,
              isBeforeLine: true,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
