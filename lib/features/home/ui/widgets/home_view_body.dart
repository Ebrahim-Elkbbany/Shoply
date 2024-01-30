import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/features/home/logic/home_products.dart';
import 'package:shoply/features/home/ui/widgets/category_list_view.dart';
import 'package:shoply/features/home/ui/widgets/product_grid_view.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeServiceProvider()
        ..getAllProduct()
        ..getAllCategory(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<HomeServiceProvider>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CategoryListView(
                  categoryList: value.categoryList
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Popular Product',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ProductGridView(
                  products:value.productList,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
