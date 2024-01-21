import 'package:flutter/material.dart';
import 'package:plant_app/ui/screen/profile/profile_header.dart';
import 'package:plant_app/ui/screen/profile/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 16),
              ProfileOption(label: 'My Profile', icon: Icons.person),
              ProfileOption(label: 'Settings', icon: Icons.settings),
              ProfileOption(label: 'Notifications', icon: Icons.notifications),
              ProfileOption(label: 'FAQ', icon: Icons.chat),
              ProfileOption(label: 'Share', icon: Icons.share),
              ProfileOption(label: 'Log Out', icon: Icons.logout),
            ],
          ),
        ),
      ),
    );
  }
}
