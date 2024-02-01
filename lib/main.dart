import 'package:flutter/material.dart';
import 'package:shoply/core/utils/theme.dart';

import 'package:shoply/features/signup-login/view/ui/signup.dart';


void main() {
  runApp(const ShoplyApp());
}

class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: SignUpScreen(),
    );
  }
}


