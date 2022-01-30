import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/cubit/search_job_cubit.dart';
import 'package:nuwai/ui/widgets/perorangan_tile.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? searchController = TextEditingController(text: '');
    String? searchResult;

    Widget header() {
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  style: blackTextStyle.copyWith(fontWeight: regular),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Cari Pekerjaan',
                    hintStyle: grayTextStyle.copyWith(fontWeight: regular),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                iconSize: 20,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    searchResult = searchController.text;
                  });
                  context
                      .read<SearchJobCubit>()
                      .getJobByName(nameJob: searchResult ?? '');
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: header(),
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<SearchJobCubit, SearchJobState>(
        listener: (context, state) {
          if (state is SearchJobFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Data pekerjaan tidak ditemukan'),
                backgroundColor: kRedColor,
              ),
            );
          } else if (state is SearchJobSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Data ditemukan'),
                backgroundColor: kGreenColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SearchJobSuccess) {
            return ListView(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 140,
              ),
              children: state.jobModel
                  .map((job) => PeroranganTile(
                        name: job.namaPekerjaan,
                        city: job.lokasiPekerjaan,
                        time: job.tenggangWaktuPekerjaan,
                      ))
                  .toList(),
            );
          }
          return Center(
            child: Lottie.asset(
              'assets/find.json',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
              repeat: true,
            ),
          );
        },
      ),
    );
  }
}
