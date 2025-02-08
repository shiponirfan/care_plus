import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static String name = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              final item = AppConstants.onBoardingList[index];
              return Column(
                children: [
                  SizedBox(
                    height: mediaQuery.width * 0.4,
                  ),
                  SvgPicture.asset(item['img']),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.themeColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item['subtitle'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: AppColors.primaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
            itemCount: AppConstants.onBoardingList.length,
          ),
          Column(
            children: [
              SizedBox(
                height: mediaQuery.width * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _moveToNextScreen();
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.themeColor,
                            )),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_currentPage < AppConstants.onBoardingList.length - 1) {
                    setState(() {
                      _currentPage += 1;
                      _pageController.animateToPage(_currentPage,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut);
                    });
                  } else {
                    _moveToNextScreen();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: AppConstants.onBoardingList.map((element) {
                  int index = AppConstants.onBoardingList.indexOf(element);
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.themeColor
                            : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.themeColor,
                        )),
                  );
                }).toList(),
              ),
              SizedBox(
                height: mediaQuery.width * 0.3,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _moveToNextScreen() {
    // Navigator.pushNamed(context, '/select-city');
  }
}
