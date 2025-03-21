import 'package:care_plus/app/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});
  static String name = '/payment-success';
  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(0, 6),
                      color: Colors.black.withValues(alpha: 0.16),
                    ),
                  ]),
              child: const Icon(
                Icons.check,
                color: AppColors.themeColor,
                size: 44,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Payment Successful',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Your Appointment is confirmed',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
