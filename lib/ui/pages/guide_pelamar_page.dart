import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/timeline_tile.dart';

class GuidePelamarPage extends StatelessWidget {
  GuidePelamarPage({Key? key}) : super(key: key);

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
              'Panduan Mendaftar\nPekerjaan',
              style: orangeTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
            TimeLineTile(
              text:
                  'Sebelum mendaftar pastikan mengisi data diri terlebih dahulu, dan jangan langsung apply pekerjaan.',
              isFirst: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text:
                  'Usahakan memasukan data diri formal seperti cv dan foto profil.',
              isBeforeLine: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text:
                  'Kami tidak meminta imbalan kepada pendaftar pekerjaan, jika ada kejadian seperti itu harap dilaporkan',
              isBeforeLine: true,
              isAfterLine: true,
            ),
            TimeLineTile(
              text:
                  'Selamat mencari pekerjaan~ jika ada keluhan sampaikan saja.',
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
