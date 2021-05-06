import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:phone_book/data/api/auth_api.dart';
import 'package:phone_book/screens/account/change_password_screen.dart';
import 'package:phone_book/screens/account/edit_profile_screen.dart';
import 'package:phone_book/widgets/custom_button_full.dart';
import 'package:phone_book/widgets/custom_dialog.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      'https://ui-avatars.com/api/?name=Tak',
                    ),
                    radius: 40.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Takeshi Kovsc',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'takeshi@kovacs.co',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            ListMenuItem(
              label: 'Edit Profile',
              onTap: () => Get.to(() => EditProfileScreen()),
            ),
            ListMenuItem(
              label: 'Change Password',
              onTap: () => Get.to(() => ChangePasswordScreen()),
            ),
            SizedBox(height: 35.0),
            CustomButtonFull(
              label: 'Logout'.toUpperCase(),
              onPressed: () {
                customDialog(
                  title: 'Logout',
                  content: Text('Are you sure?'),
                  onPressed: () async {
                    final _authApi = AuthAPI();
                    _authApi.logout();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListMenuItem extends StatelessWidget {
  final String label;
  final GestureTapCallback onTap;

  const ListMenuItem({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 18, 0, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label,
                    style: TextStyle(fontSize: 15, color: Color(0xFF515151))),
                Icon(Icons.chevron_right, size: 20, color: Colors.grey),
              ],
            ),
          ),
        ),
        Divider(height: 0, color: Colors.grey[400])
      ],
    );
  }
}
