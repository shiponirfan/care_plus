import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/app_constants.dart';
import 'package:care_plus/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  static String name = '/select-city';

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  int selectedCity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text(
          'Select City',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          _buildSearchInput(),
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: AppColors.primaryTextColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Use Your Current Location',
                  style: TextStyle(color: AppColors.primaryTextColor),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedCity = index;
                        setState(() {});
                        Navigator.pushNamed(context, OnboardingScreen.name);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          AppConstants.selectCity[index],
                          style: TextStyle(
                            color: selectedCity == index
                                ? AppColors.primaryTextColor
                                : AppColors.secondaryTextColor,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Color(0xffE5E5E5),
                    );
                  },
                  itemCount: AppConstants.selectCity.length),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchInput() {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          ),
          Positioned(
            bottom: -30,
            left: 20,
            right: 20,
            child: Material(
              elevation: 16,
              shadowColor: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(5),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Search your City',
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.secondaryTextColor,
                    )),
              ),
            ),
          )
        ]);
  }
}
