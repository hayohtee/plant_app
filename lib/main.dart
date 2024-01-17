import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/ui/screen/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return const MaterialApp(
      title: 'Plant App',
      home: OnBoardingScreen(),
    );
  }
}
