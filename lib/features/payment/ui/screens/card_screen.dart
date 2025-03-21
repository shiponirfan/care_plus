import 'package:care_plus/features/common/ui/widgets/custom_app_bar.dart';
import 'package:care_plus/features/payment/ui/screens/payment_successful_screen.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});
  static String name = '/card';
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return CustomAppBar(
        title: 'Add your Card',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(child: Image.asset('assets/images/card.png')),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Cardholder Name',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Manish Chutake',
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Card Number',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: _size.width / 4 - 17.5,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '1234'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: _size.width / 4 - 17.5,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '5678'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: _size.width / 4 - 17.5,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '9012'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: _size.width / 4 - 17.5,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '3456'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Valid Thru',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: _size.width / 1.6,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'August',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: _size.width / 4,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '2034'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'CVV/CVC',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: _size.width / 4,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '980'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '3 or 4 digit code',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PaymentSuccessfulScreen.name);
              },
              child: const Text('Add Card Number'),
            ),
          ],
        ));
  }
}
