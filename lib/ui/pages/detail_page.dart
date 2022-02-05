import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/models/work_model.dart';
import 'package:nuwai/models/job_model.dart';
import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/cubit/work_cubit.dart';
import 'package:nuwai/ui/widgets/custom_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
    this.jobModel,
    this.workModel,
  }) : super(key: key);

  final JobModel? jobModel;
  final WorkModel? workModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void showConfirmation() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Konfirmasi',
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    'Apply?',
                    style: orangeTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Batal',
                  style: blackTextStyle.copyWith(fontWeight: regular),
                ),
              ),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UserFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Gagal apply'),
                        backgroundColor: kRedColor,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return TextButton(
                      // TODO: apply work
                      onPressed: () {
                        context.read<PageCubit>().setPage(0);
                        context.read<WorkCubit>().applyWork(
                              userToken: state.user.userToken,
                              idUser: state.user.dataUser?.id,
                              idJob: widget.jobModel?.id,
                            );
                        print(state.user.userToken ?? 'ga ada');
                        Navigator.pushNamed(context, '/success');
                        // print(state.user.dataUser?.id ?? '');
                        // print(widget.jobModel?.id ?? 'G ada');
                      },
                      child: Text(
                        'Iya',
                        style: blackTextStyle.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.jobModel?.fotoLowongan ??
                  'https://baa.undip.ac.id/wp-content/uploads/2014/01/lowongan-kerja.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget logo() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  // TODO: conditional if image null
                  Image.network(
                widget.jobModel?.logoPerusahaanPath ?? 'assets/logo_nuwai.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      // TODO: lost the glowing light overscroll
      return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: ListView(
          children: [
            SizedBox(height: 220),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/logo_company.png',
                                width: 28,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  widget.jobModel?.namaPerusahaan ?? 'No name',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          widget.jobModel?.lokasiPekerjaan ?? 'No location',
                          overflow: TextOverflow.ellipsis,
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.jobModel?.namaPekerjaan ?? 'No job',
                            maxLines: 2,
                            style: orangeTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 24,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Tersedia Sampai',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Gaji IDR ',
                              decimalDigits: 0,
                            ).format(widget.jobModel?.gaji ?? 0),
                            style: orangeTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/y')
                              .format(
                                widget.jobModel?.tenggangWaktuPekerjaan ??
                                    DateTime.now(),
                              )
                              .toString(),
                          style: orangeTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deskripsi Pekerjaan',
                          style: orangeTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          // TODO: non null
                          widget.jobModel?.deskripsi ?? 'No description',
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Tentang Perusahaan',
                          style: orangeTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.jobModel?.tentangPembukaLowongan ??
                              'No information',
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // TODO: Logic Enable
                        BlocConsumer<WorkCubit, WorkState>(
                          listener: (context, state) {
                            if (state is WorkSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Kamu Apply pekerjaan ini'),
                                  backgroundColor: kRedColor,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is WorkSuccess) {
                              return CustomButton(
                                title: 'Apply',
                                onPressed: () {},
                                isApply: state.workModel.isApply,
                              );
                            } else {
                              return CustomButton(
                                title: 'Apply',
                                onPressed: () {
                                  showConfirmation();
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          header(),
          customShadow(),
          content(),
          logo(),
        ],
      ),
    );
  }
}
