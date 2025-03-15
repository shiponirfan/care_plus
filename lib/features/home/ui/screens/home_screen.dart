import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/app_constants.dart';
import 'package:care_plus/features/doctors/ui/screens/doctors_list_screen.dart';
import 'package:care_plus/features/home/ui/widgets/drawer_menu_widget.dart';
import 'package:care_plus/features/home/ui/widgets/home_card_view_widget.dart';
import 'package:care_plus/features/search/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarePlus'),
        actions: [
          Container(
            height: 24,
            width: 66,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 10,
                  color: Colors.black,
                ),
                Text(
                  'Rangpur',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, SearchScreen.name);
          }, icon: const Icon(Icons.search_outlined)),
        ],
      ),
      drawer: const DrawerMenuWidget(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 44,
                ),
                _buildCategoryListView(),
                const SizedBox(
                  height: 20,
                ),
                _buildSlider(),
                const SizedBox(
                  height: 20,
                ),
                _buildSectionHeading(
                  title: 'Doctors Near By You',
                  onTap: () {
                    Navigator.pushNamed(context, DoctorsListScreen.name);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildNearDoctorsListView(),
                const SizedBox(
                  height: 20,
                ),
                _buildSectionHeading(
                  title: 'Doctors For Heart Issue',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildNearMedicalShopListView(),
                const SizedBox(
                  height: 20,
                ),
                _buildSectionHeading(
                  title: 'Doctors For Lung Issue',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildNearDoctorsListView(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: 24,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(
      {required String title, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'See all',
            style: TextStyle(
              color: AppColors.themeColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          Map item = AppConstants.categoryList[index];
          return Column(
            children: [
              Container(
                width: 72,
                height: 72,
                // margin: EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .10),
                        blurRadius: 16,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: SvgPicture.asset(
                  item['img'],
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                item['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          );
        },
        itemCount: AppConstants.categoryList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget _buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.9,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: AppConstants.sliderImg.map((img) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(img,
                      width: double.infinity, fit: BoxFit.cover)),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildNearDoctorsListView() {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          Map item = AppConstants.doctorList[index];
          return HomeCardViewWidget(
              img: item['img'],
              title: item['title'],
              subtitle: item['subtitle'],
              rating: item['rating']);
        },
        itemCount: AppConstants.doctorList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget _buildNearMedicalShopListView() {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          Map item = AppConstants.doctorList[index];
          return HomeCardViewWidget(
              img: item['img'],
              title: item['title'],
              subtitle: item['subtitle'],
              rating: item['rating']);
        },
        itemCount: AppConstants.doctorList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
