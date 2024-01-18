import 'package:flutter/material.dart';
import 'package:shoply/home/ui/home_view.dart';
import 'package:shoply/signup-login/signup.dart';

void main() {
  runApp(const ShoplyApp());
}

class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignUpScreen(),
    );
  }
}


