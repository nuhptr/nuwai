import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nuwai/cubit/page_cubit.dart';
import 'package:nuwai/cubit/user_cubit.dart';
import 'package:nuwai/ui/pages/coming_soon_page.dart';
import 'package:nuwai/ui/pages/edit_profile_page.dart';
import 'package:nuwai/ui/pages/get_started_page.dart';
import 'package:nuwai/ui/pages/guide_page.dart';
import 'package:nuwai/ui/pages/main_page.dart';
import 'package:nuwai/ui/pages/sign_in_page.dart';
import 'package:nuwai/ui/pages/sign_up_page.dart';
import 'package:nuwai/ui/pages/splash_page.dart';

void main() async {
  await init();
  runApp(MyApp());
}

Future<void> init() async {
  //TODO: lock device orientation
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main': (context) => MainPage(),
          '/coming-soon': (context) => ComingSoon(),
          '/guide': (context) => GuidePage(),
          '/edit': (context) => EditProfil(),
        },
      ),
    );
  }
}
