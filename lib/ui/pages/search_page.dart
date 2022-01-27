import 'package:flutter/material.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/perorangan_tile.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? searchController = TextEditingController(text: '');
    String? searchResult = '';
    bool? isSearch = false;

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
                splashColor: Colors.transparent,
                onPressed: () {},
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
      body: ListView(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 140,
        ),
        children: [
          PeroranganTile(
            name: 'ngasal',
            city: 'ngasal',
          ),
        ],
      ),
    );
  }
}
