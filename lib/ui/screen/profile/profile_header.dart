import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Constants.primaryColor,
              width: 5,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'John Doe',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 24,
              child: Image.asset('assets/images/verified.png'),
            )
          ],
        ),
        Text(
          'johndoe@gmail.com',
          style: TextStyle(
            color: Constants.blackColor.withOpacity(0.3),
          ),
        )
      ],
    );
  }
}
