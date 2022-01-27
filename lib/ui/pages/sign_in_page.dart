import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/shared/theme.dart';
import 'package:nuwai/ui/widgets/custom_button.dart';
import 'package:nuwai/ui/widgets/custom_text_formfield.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool? isObscure = true;

  TextEditingController? emailController = TextEditingController(text: '');
  TextEditingController? passwordController = TextEditingController(text: '');

  @override
  void dispose() {
    emailController;
    passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundBag() {
      return Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 290,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image_bag.png'),
            ),
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin, top: 50),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Masuk dan mulai\nmencari pekerjaan',
            style: orangeTextStyle.copyWith(
              fontSize: 28,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget content() {
      Widget header() {
        return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Text(
            'Masuk',
            style: orangeTextStyle.copyWith(
              fontSize: 28,
              fontWeight: semiBold,
            ),
          ),
        );
      }

      Widget inputField() {
        return Column(
          children: [
            CustomTextFormField(
              title: 'Email',
              hintText: 'Your email',
              inputType: TextInputType.emailAddress,
              textEditingController: emailController,
            ),
            CustomTextFormField(
              title: 'Password',
              hintText: 'Your password',
              textEditingController: passwordController,
              endForm: true,
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
                  content: Text('Gagal Login'),
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
              title: 'Masuk',
              onPressed: () {
                context.read<UserCubit>().login(
                    email: emailController?.text,
                    password: passwordController?.text);
              },
            );
          },
        );
      }

      Widget signUpTextButton() {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun?',
                style: grayTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
              ),
              SizedBox(width: 2),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text(
                  'Daftar',
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

      return Container(
        height: 500,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 160,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            inputField(),
            submitButton(),
            signUpTextButton(),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          backgroundBag(),
          header(),
          content(),
        ],
      ),
    );
  }
}
