import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/assets_path.dart';
import 'package:care_plus/features/auth/ui/screens/number_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SvgPicture.asset(
              AssetsPath.appLogoSvg,
              width: 134,
            ),
          ),
          SizedBox(
            height: mediaQuery.width * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NumberInputScreen.name);
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.secondaryTextColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/smartphone.svg'),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Mobile number',
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Or'),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.secondaryTextColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/google.svg'),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Google',
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'By signing in , You accepting our ',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
