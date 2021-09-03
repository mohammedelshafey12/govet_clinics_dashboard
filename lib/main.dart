import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Provider/model_hud.dart';
import 'package:provider/provider.dart';

import 'Screens/Auth/sign_up_screen.dart';
import 'Screens/Home/home_screen.dart';
import 'Screens/Home/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GoVet Clinics Dashboard',
        home: SignUpScreen(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'custom_font_bold',
              fontSize: 20.0,
              letterSpacing: 0.3,
            ),
            color: Colors.white,
            centerTitle: true,
          )
        ),
      ),
    );
  }
}
