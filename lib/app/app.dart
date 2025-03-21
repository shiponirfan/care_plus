import 'package:care_plus/app/app_theme_data.dart';
import 'package:care_plus/features/auth/ui/screens/login_screen.dart';
import 'package:care_plus/features/auth/ui/screens/number_input_screen.dart';
import 'package:care_plus/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:care_plus/features/booking/ui/screens/booking_screen.dart';
import 'package:care_plus/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:care_plus/features/doctors/ui/screens/doctors_list_screen.dart';
import 'package:care_plus/features/doctors/ui/screens/doctors_profile_screen.dart';
import 'package:care_plus/features/home/ui/screens/home_screen.dart';
import 'package:care_plus/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:care_plus/features/onboarding/ui/screens/select_city_screen.dart';
import 'package:care_plus/features/onboarding/ui/screens/splash_screen.dart';
import 'package:care_plus/features/payment/ui/screens/card_screen.dart';
import 'package:care_plus/features/payment/ui/screens/pay_now_screen.dart';
import 'package:care_plus/features/payment/ui/screens/payment_successful_screen.dart';
import 'package:care_plus/features/search/ui/screens/search_screen.dart';
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
        } else if (settings.name == OtpVerificationScreen.name) {
          route = const OtpVerificationScreen();
        } else if (settings.name == MainBottomNavbarScreen.name) {
          route = const MainBottomNavbarScreen();
        } else if (settings.name == HomeScreen.name) {
          route = const HomeScreen();
        } else if (settings.name == SearchScreen.name) {
          route = const SearchScreen();
        } else if (settings.name == DoctorsListScreen.name) {
          route = const DoctorsListScreen();
        } else if (settings.name == DoctorsProfileScreen.name) {
          route = const DoctorsProfileScreen();
        } else if (settings.name == BookingScreen.name) {
          route = const BookingScreen();
        } else if (settings.name == PayNowScreen.name) {
          route = const PayNowScreen();
        } else if (settings.name == CardScreen.name) {
          route = const CardScreen();
        } else if (settings.name == PaymentSuccessfulScreen.name) {
          route = const PaymentSuccessfulScreen();
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
