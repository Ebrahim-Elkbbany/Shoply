import 'package:flutter/material.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/category/view/ui/category_products.dart';
import 'package:shoply/features/home/logic/home_products.dart';
import 'package:shoply/features/home/models/products_model.dart';

class CategoryRows extends StatelessWidget {
  CategoryRows({Key? key, required this.categoryList, required this.homeServiceProvider,})
      : super(key: key);
  final List<String> categoryList;
  final HomeServiceProvider homeServiceProvider;

  int idx = -1;
  List<String> images = [
    "assets/images/electronics.jpeg",
    "assets/images/jewellery.png",
    "assets/images/man clothing.png",
    "assets/images/woman clothing.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, index) {

          idx = (idx + 1) % categoryList.length;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {

                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return CategoryProducts(categoryName:categoryList[index] ,homeServiceProvider: homeServiceProvider,);
                   },));

                  },
                  child: Container(
                      width: 580,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            height: 90,
                            child: Image.asset(images[idx]),
                          ),
                          SizedBox(
                            width: 150,
                            height: 70,
                            child: Text(
                              categoryList[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: AppColors.kPrimaryColor),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
