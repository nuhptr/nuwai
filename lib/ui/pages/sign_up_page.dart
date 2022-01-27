import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuwai/cubit/user_cubit.dart';

import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/custom_button.dart';
import 'package:nuwai/ui/widgets/custom_text_formfield.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? isObscure = true;
  bool? isSecondObsecure = true;

  TextEditingController? nameController = TextEditingController(text: '');
  TextEditingController? emailController = TextEditingController(text: '');
  TextEditingController? passwordController = TextEditingController(text: '');
  TextEditingController? confirmPasswordController =
      TextEditingController(text: '');

  @override
  void dispose() {
    nameController;
    emailController;
    passwordController;
    confirmPasswordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: 90,
        height: 50,
        margin: EdgeInsets.only(top: 50),
        child: Image.asset('assets/logo_nuwai.png'),
      );
    }

    Widget inputForm() {
      Widget inputField() {
        return Column(
          children: [
            CustomTextFormField(
              title: 'Nama Lengkap',
              hintText: 'Nama Lengkapmu',
              inputType: TextInputType.name,
              textEditingController: nameController,
            ),
            CustomTextFormField(
              title: 'Email',
              hintText: 'Email mu',
              inputType: TextInputType.emailAddress,
              textEditingController: emailController,
            ),
            CustomTextFormField(
              title: 'Kata Sandi',
              hintText: 'Kata sandimu',
              textEditingController: passwordController,
              obscureText: isObscure,
              inputType: TextInputType.visiblePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure!;
                  });
                },
                child: Icon(
                  (isObscure == true)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kBlackColor,
                ),
              ),
            ),
            CustomTextFormField(
              title: 'Konfirmasi Kata Sandi',
              hintText: 'Ketik sekali lagi',
              textEditingController: confirmPasswordController,
              endForm: true,
              obscureText: isSecondObsecure,
              inputType: TextInputType.visiblePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isSecondObsecure = !isSecondObsecure!;
                  });
                },
                child: Icon(
                  (isSecondObsecure == true)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        );
      }

      Widget submitButton() {
        return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/main',
                (route) => false,
              );
            } else if (state is UserFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Gagal Mendaftar'),
                  backgroundColor: kRedColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              title: 'Daftar',
              onPressed: () {
                context.read<UserCubit>().signUp(
                      name: nameController?.text,
                      email: emailController?.text,
                      password: passwordController?.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        height: 560,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 50,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputField(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signInTextButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun?',
              style: grayTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            SizedBox(width: 2),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Login',
                style: grayTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
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
            inputForm(),
            signInTextButton(),
          ],
        ),
      ),
    );
  }
}
