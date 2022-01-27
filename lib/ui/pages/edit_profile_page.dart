import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuwai/cubit/user_cubit.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/ui/widgets/custom_button.dart';
import 'package:nuwai/ui/widgets/custom_text_formfield.dart';

class EditProfil extends StatefulWidget {
  EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  TextEditingController? nameController = TextEditingController(text: '');
  TextEditingController? emailController = TextEditingController(text: '');
  TextEditingController? alamatController = TextEditingController(text: '');

  XFile? imageFile;
  XFile? cvFileImage;

  @override
  void dispose() {
    nameController;
    emailController;
    alamatController;
    super.dispose();
  }

  // TODO: get image Photo from gallery
  Future getImageFromGallery() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      if (image != null) {
        imageFile = image;
      } else {
        print('No image selected');
      }
    });
  }

  // TODO: get image cv from gallery
  Future getImageCvFromGallery() async {
    var cvFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    setState(() {
      if (cvFile != null) {
        cvFileImage = cvFile;
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              context.read<PageCubit>().setPage(2);
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      );
    }

    Widget content() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 140,
                    height: 140,
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageFile == null
                            ? NetworkImage(state.user.photoProfile ?? '')
                            : FileImage(File(imageFile!.path)) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          //TODO: get image from gallery
                          getImageFromGallery();
                        },
                        child: Image.asset(
                          'assets/tambah_foto.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget input() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Column(
              children: [
                CustomTextFormField(
                  title: 'Nama Lengkap',
                  hintText: state.user.name ?? 'Name not found',
                  isEnable: false,
                  textEditingController: nameController,
                ),
                CustomTextFormField(
                  title: 'Email',
                  hintText: state.user.email ?? 'Email not found',
                  isEnable: false,
                  textEditingController: emailController,
                ),
                CustomTextFormField(
                  title: 'Alamat Lengkap',
                  hintText: state.user.alamat ?? 'alamat not found',
                  textEditingController: alamatController,
                  inputType: TextInputType.text,
                )
              ],
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget cv() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    width: 144,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: cvFileImage == null
                            ? NetworkImage(
                                state.user.cvPath ?? '',
                              )
                            : FileImage(File(cvFileImage!.path))
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 35),
                  GestureDetector(
                    onTap: () {
                      // add foto from gallery
                      getImageCvFromGallery();
                    },
                    child: Text(
                      'Upload CV',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
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

    Widget submitButton() {
      return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Gagal Update'),
              backgroundColor: kRedColor,
            ));
          } else if (state is UserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Berhasil update'),
              backgroundColor: Colors.green.shade300,
            ));
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserSuccess) {
            return CustomButton(
              title: 'Perbaharui',
              onPressed: () {
                context.read<UserCubit>().update(
                      alamat: alamatController?.text,
                      photoProfile: imageFile?.path,
                      cvPath: cvFileImage?.path,
                      token: state.user.token,
                    );
              },
              margin: EdgeInsets.only(top: 30, bottom: 20),
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
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            header(),
            content(),
            input(),
            cv(),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
