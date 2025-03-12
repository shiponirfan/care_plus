import 'package:care_plus/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      'assets/images/doctor1.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shipon Irfan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Rangpur',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/calander.svg'),
            title: const Text('My Appointments'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/plus.svg'),
            title: const Text('New Appointment'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/file.svg'),
            title: const Text('Medical Records'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/message.svg'),
            title: const Text('Forum'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/User.svg'),
            title: const Text('Account Settings'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/Info.svg'),
            title: const Text('Help'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/images/leav.svg'),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
