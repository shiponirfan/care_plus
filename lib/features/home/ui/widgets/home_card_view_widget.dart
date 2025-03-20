import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/features/doctors/ui/screens/doctors_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeCardViewWidget extends StatelessWidget {
  const HomeCardViewWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.rating});

  final String img;
  final String title;
  final String subtitle;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DoctorsProfileScreen.name);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 122,
            height: 140,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
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
                const SizedBox(
                  height: 24,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 9,
                      color: AppColors.secondaryTextColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                RatingBar.builder(
                  initialRating: rating,
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
                  height: 8,
                ),
                Text(
                  '($rating)',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  img,
                  width: 56,
                  height: 56,
                )),
          ),
        ],
      ),
    );
  }
}
