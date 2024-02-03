import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/category/view/ui/category_rows.dart';
import 'package:shoply/features/home/logic/home_products.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ChangeNotifierProvider(
        create: (context) => HomeServiceProvider()..getAllCategory()..getCategoryProducts(categoryName: 'jewelery'),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Consumer<HomeServiceProvider>(
            builder: (context, homeProvider, child) {
              return Column(
                children: [
                  const Center(
                    child: Text(
                      "Category",
                      style: TextStyle(color: Colors.black87, fontSize: 33),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 10,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black38,
                              Colors.grey,
                              Color(0xffF4C2C2),
                              Colors.black
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 44, left: 8.0, right: 8.0, bottom: 8.0),
                    child: Stack(children: [
                      Container(
                        height: 520,
                        decoration: BoxDecoration(
                            color: const Color(0xfff0e4e1),
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      SizedBox(
                        height: 550,
                        child: CategoryRows(
                          homeServiceProvider: homeProvider,
                          categoryList: homeProvider.categoryList,
                        ),
                      ),
                    ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
