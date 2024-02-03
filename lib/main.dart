import 'package:flutter/material.dart';
import 'package:shoply/core/utils/theme.dart';
import 'package:shoply/features/cart/logic/sql_provider.dart';
import 'package:shoply/features/layout/layout_view.dart';
import 'package:shoply/features/signup-login/view/ui/signup.dart';

import 'features/favourite_products/favourite_products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartProvider.instance.open();
  runApp(const ShoplyApp());
}

class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: SignUpScreen(),
    );
  }
}
