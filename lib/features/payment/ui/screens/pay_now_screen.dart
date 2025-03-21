import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/app_constants.dart';
import 'package:care_plus/features/payment/ui/screens/card_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayNowScreen extends StatefulWidget {
  const PayNowScreen({super.key});

  static String name = '/pay-now';

  @override
  State<PayNowScreen> createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RichText(
            text: const TextSpan(
                text: 'Total Bill : ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
              TextSpan(
                text: '\$50',
                style: TextStyle(color: AppColors.themeColor),
              )
            ])),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 10,
                ),
                Text('Dr.Manish Chutake',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const DottedLine(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.black,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Home Adress',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          'D Block  Ram Nagar ,Near Sai Petrol Pump Ring Road Nagpur-440001',
                          style:
                              TextStyle(color: AppColors.secondaryTextColor)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Credit/Debit Cards',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text('ADD NEW CARD',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.themeColor,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(
                  CupertinoIcons.creditcard,
                  size: 44,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('**** **** **** 1234',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    Text('Manish Chutake',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.secondaryTextColor)),
                  ],
                )
              ],
            ),
            const Divider(
              height: 30,
            ),
            const Text('Save and Pay via cards',
                style: TextStyle(
                    fontSize: 12, color: AppColors.secondaryTextColor)),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String img = AppConstants.cards[index];
                    return Image.asset(
                      img,
                      width: 48,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: AppConstants.cards.length),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Wallet Method',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  Map item = AppConstants.wallet[index];
                  return Row(
                    children: [
                      Image.asset(
                        item['img'],
                        width: 48,
                      ),
                      Text(item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: AppConstants.wallet.length),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, CardScreen.name);
            }, child: const Text('Pay Now'))
          ],
        ),
      ),
    );
  }
}
