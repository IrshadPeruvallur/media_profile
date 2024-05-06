import 'package:flutter/material.dart';
import 'package:profile_page/controller/media_controller.dart';
import 'package:profile_page/view/profile/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MediaController(),
      child: const MaterialApp(
        home: ProfilePage(),
      ),
    );
  }
}
