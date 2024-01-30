import 'package:flutter/material.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/product/product_details.dart';
import 'package:shoply/features/signup-login/shared_customs/constants_class.dart';

class CategoryRows extends StatelessWidget with Constants {
  CategoryRows({Key? key, required this.categoryList}) : super(key: key);
  final List<String> categoryList;
  int idx = -1;
  List<String> images = [
    "assets/images/electronic devices.png",
    "assets/images/necklace.png",
    "assets/images/men clothes.png",
    "assets/images/woman clothes.jpg"
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ProductDetails()));
                  },
                  child: Container(
                      width: 580,
                      height: 100,
                      decoration: BoxDecoration(
                        color: containerColor,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: const Icon(
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
