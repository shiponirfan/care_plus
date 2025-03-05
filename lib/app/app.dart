import 'package:care_plus/app/app_theme_data.dart';
import 'package:care_plus/features/auth/ui/screens/login_screen.dart';
import 'package:care_plus/features/auth/ui/screens/number_input_screen.dart';
import 'package:care_plus/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:care_plus/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:care_plus/features/onboarding/ui/screens/select_city_screen.dart';
import 'package:care_plus/features/onboarding/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CarePlusApp extends StatelessWidget {
  const CarePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      initialRoute: SplashScreen.name,
      onGenerateRoute: (RouteSettings settings) {
        late Widget route;
        if (settings.name == SplashScreen.name) {
          route = const SplashScreen();
        } else if (settings.name == SelectCityScreen.name) {
          route = const SelectCityScreen();
        } else if (settings.name == OnboardingScreen.name) {
          route = const OnboardingScreen();
        } else if (settings.name == LoginScreen.name) {
          route = const LoginScreen();
        } else if (settings.name == NumberInputScreen.name) {
          route = const NumberInputScreen();
        }else if (settings.name == OtpVerificationScreen.name) {
          route = const OtpVerificationScreen();
        }
        return MaterialPageRoute(
          builder: (context) {
            return route;
          },
        );
      },
    );
  }
}
