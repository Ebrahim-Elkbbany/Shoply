import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/features/layout/logic/bottom_nav_logic.dart';


class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavLogic(),
      child: Consumer<BottomNavLogic>(
        builder: (context, bottomNavLogic, child) {
          return Scaffold(
            body: bottomNavLogic.bottomScreen[bottomNavLogic.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomNavLogic.currentIndex,
              onTap: (index) {
                bottomNavLogic.changeBottomScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category_outlined,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outlined,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
