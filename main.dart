import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'login_screen.dart';
import 'basic_laws.dart';
import 'location_sharing.dart';
import 'nearby_guardian.dart';
import 'elearn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abhayam',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/home': (context) => HomeScreen(),
        '/basic-laws': (context) => BasicLawsScreen(),
        '/location-sharing': (context) => LocationSharingScreen(),
        '/nearby-guardian': (context) => NearbyGuardianScreen(),
        '/e-learning': (context) => ELearningScreen(),
      },
    );
  }
}
