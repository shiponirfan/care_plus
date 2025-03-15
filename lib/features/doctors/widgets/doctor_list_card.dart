import 'package:care_plus/app/app_colors.dart';
import 'package:care_plus/features/doctors/ui/screens/doctors_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorListCard extends StatelessWidget {
  const DoctorListCard({
    super.key,
    required this.item,
  });

  final Map item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DoctorsProfileScreen.name);
      },
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                item['img'],
                width: 80,
                height: 80,
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item['subtitle'],
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9,
                    color: AppColors.secondaryTextColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item['location'],
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 9,
                    color: AppColors.secondaryTextColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: item['rating'],
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
                    '(${item['rating']})',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 9,
                        color: AppColors.secondaryTextColor),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 34,
              ))
        ],
      ),
    );
  }
}
