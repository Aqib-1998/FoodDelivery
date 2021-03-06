import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/auth.dart';
import 'package:food_delivery/Utils/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'Pages/LoginScreen.dart';
import 'package:page_transition/page_transition.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Food Delivery',
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 3,
            splash: "lib/Images/SplashScreen.png",
            nextScreen: CheckUser(auth: Auth(),),
            splashIconSize: 100,
            animationDuration: Duration(seconds: 1),
            pageTransitionType: PageTransitionType.leftToRightWithFade,
            splashTransition: SplashTransition.slideTransition,
            backgroundColor: Colors.white
        ),
      ),
    );
  }
}
