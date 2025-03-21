import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/features/common/ui/widgets/custom_app_bar.dart';
import 'package:care_plus/features/payment/ui/screens/pay_now_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  static String name = '/booking';

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController _dateTEController = TextEditingController();
  final TextEditingController _reasonTEController = TextEditingController();
  final TextEditingController _messageTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: 'Appointment Booking',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _dateTEController,
              onTap: _selectDate,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Select Date',
                suffixIcon: Icon(Icons.date_range),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Reason For Visit',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _reasonTEController,
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Massage',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _messageTEController,
              maxLines: 5,
            ),
            const SizedBox(
              height: 28,
            ),
            RichText(
                text: const TextSpan(
                    text: 'Fees- ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: [
                  TextSpan(
                    text: '50\$',
                    style: TextStyle(color: AppColors.themeColor),
                  )
                ])),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PayNowScreen.name);
              },
              child: const Text('Make a Payment'),
            ),
          ],
        ));
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat.yMMMMd().format(pickedDate);

      setState(() {
        _dateTEController = TextEditingController(text: formattedDate);
      });
    }
  }
}
