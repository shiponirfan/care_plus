import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/assets_path.dart';
import 'package:care_plus/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              'Enter Verification code',
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
              'Enter Six digit code that send to your Mobile',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              backgroundColor: Colors.transparent,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldWidth: 40,
              ),
              animationDuration: const Duration(milliseconds: 300),
              controller: _otpTEController,
              appContext: context,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MainBottomNavbarScreen.name);
              },
              child: const Text(
                'Verify',
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
