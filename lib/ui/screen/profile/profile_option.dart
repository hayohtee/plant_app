import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Constants.blackColor.withOpacity(0.5),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Constants.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Constants.blackColor.withOpacity(0.4),
            size: 18,
          )
        ],
      ),
    );
  }
}
