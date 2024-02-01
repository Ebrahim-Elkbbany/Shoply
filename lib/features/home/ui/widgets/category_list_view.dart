import 'package:flutter/material.dart';
import 'package:shoply/core/utils/colors.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categoryList});
  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kSecondaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/electroncs.jpg'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categoryList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 21);
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
