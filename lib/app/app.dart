import 'package:care_plus/app/app_theme_data.dart';
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
