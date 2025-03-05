import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/assets_path.dart';
import 'package:care_plus/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  static String name = '/number-input';

  @override
  State<NumberInputScreen> createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            SvgPicture.asset(AssetsPath.appLogoGreenSvg),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Enter Mobile Number',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.themeColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'The verification code will send to the number',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.secondaryTextColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: mediaQuery.width * 0.2,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.secondaryTextColor),
                    ),
                    child: const Text('+880'),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        hintText: '1710000000',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, OtpVerificationScreen.name);
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
