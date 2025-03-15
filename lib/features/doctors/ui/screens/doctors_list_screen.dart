import 'package:care_plus/app/app_constants.dart';
import 'package:care_plus/features/common/ui/widgets/custom_app_bar.dart';
import 'package:care_plus/features/doctors/widgets/doctor_list_card.dart';
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  static String name = '/doctors-list';

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: 'Doctors List',
        body: Column(
          children: [
            const SizedBox(
              height: 44,
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
                itemCount: AppConstants.doctorList.length)
          ],
        ));
  }
}
