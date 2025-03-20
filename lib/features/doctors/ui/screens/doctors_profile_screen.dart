import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/app/app_constants.dart';
import 'package:care_plus/features/booking/ui/screens/booking_screen.dart';
import 'package:care_plus/features/doctors/widgets/doctor_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorsProfileScreen extends StatefulWidget {
  const DoctorsProfileScreen({super.key});

  static String name = '/doctors-profile';

  @override
  State<DoctorsProfileScreen> createState() => _DoctorsProfileScreenState();
}

class _DoctorsProfileScreenState extends State<DoctorsProfileScreen> {
  Map doctor = AppConstants.doctorProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: _buildAppBar(context),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 48,
          decoration: BoxDecoration(
              color: const Color(0xffEDEDED),
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 60),
                child: Text(
                  'Give Feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    onPressed: () {
                      Navigator.pushNamed(context, BookingScreen.name);
                    },
                    child: const Text('Book')),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          _buildAppBarContainer(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                _buildDoctorProfileCard(),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .10),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Timings',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Temporary closed',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                ),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                              Text(
                                'Open',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.themeColor,
                                ),
                              ),
                              Icon(
                                Icons.check,
                                size: 18,
                                color: AppColors.themeColor,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Mon-FRI ( 11:00am- 05:00pm)',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Services and Facility',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Cardiac Rehabilitisation',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Cardiac Surgery',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Cardiac Intensive care',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Experience',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount:
                            AppConstants.doctorProfile['description'].length,
                        itemBuilder: (context, index) {
                          List<String> item =
                              AppConstants.doctorProfile['description'];
                          return _buildExperienceCard(text: item[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Feedback',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        doctor['feedback'],
                        style: const TextStyle(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        doctor['address'],
                        style: const TextStyle(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: AppColors.themeColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            doctor['phone'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Other Staff',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            Map item = AppConstants.doctorList[index];
                            return DoctorListCard(item: item);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: 5)
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

  Container _buildAppBarContainer() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: const Text('Doctor Profile'),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
      ),
    );
  }

  Widget _buildExperienceCard({required String text}) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorProfileCard() {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 310,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .10),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ]),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                doctor['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                doctor['designation'],
                style: const TextStyle(color: AppColors.secondaryTextColor),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                doctor['subtitle'],
                style: const TextStyle(color: AppColors.secondaryTextColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: doctor['rating'],
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemSize: 15,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '(${doctor['rating']})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: doctor['experience'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor,
                          ),
                          children: const [
                        TextSpan(
                          text: ' Years Experience',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        )
                      ])),
                  RichText(
                      text: TextSpan(
                          text: '${doctor['fees']}\$',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor,
                          ),
                          children: const [
                        TextSpan(
                          text: ' Fees',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        )
                      ])),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    List<String> item = AppConstants.doctorProfile['images'];
                    return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          item[index],
                          width: 64,
                          height: 64,
                        ));
                  },
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -50,
          child: Container(
            width: 102,
            height: 102,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  doctor['img'],
                  width: 100,
                  height: 100,
                )),
          ),
        ),
      ],
    );
  }
}
