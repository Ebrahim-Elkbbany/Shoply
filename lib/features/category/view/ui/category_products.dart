import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/features/home/logic/home_products.dart';
import 'package:shoply/features/home/ui/widgets/product_grid_view.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key, required this.categoryName, required this.homeServiceProvider});
  final String categoryName;
  final HomeServiceProvider homeServiceProvider;
  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider(
   create: (context) =>  HomeServiceProvider()..getCategoryProducts(categoryName: categoryName),
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          child: Consumer<HomeServiceProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  ProductGridView(products: value.categoryProductsList),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
