import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuwai/cubit/page_cubit.dart';

import 'package:nuwai/shared/theme.dart';

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
                context.read<PageCubit>().setPage(2);
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
        height: 580,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
            const SizedBox(height: 20),
            Text(
              '1.  Hubungi no.wa 089674135843\nHal ini bertujuan untuk menghindari pembukaan lowongan yang bersifat menipu.\n\n2.  Sertakan KTP, dan data-data\npekerjaan yang bisa dilihat di halaman detail pekerjaan.\n\n3. Untuk gaji boleh dicantumkan/\ntidak.\n\n4. Pekerjaan bersifat halal, dan tidak terpaku dengan bulanan/ tetap, contoh : Pencuci Piring untuk 2 Jam.\n\n5. Dengan membaca point 1-4\nanda menyetujui persyaratan\ndan persetujuan kami.\n\nSelamat Mencari Jasa~',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            )
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
