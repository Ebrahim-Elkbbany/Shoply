import 'package:flutter/material.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/home/models/products_model.dart';
import 'package:shoply/features/product/product_details.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 150 / 215,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(products.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductDetails(details: products[index]);
            },));
          },
          child: Stack(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    width: 1,
                    color: AppColors.kSecondaryColor,
                  ),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          products[index].image,
                          height: 160,
                          width: 100,
                        ),
                      ),
                      Text(
                        products[index].title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.kSecondaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${products[index].price.toString()} \$',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kSecondaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 20,
                right: 15,
                child: Icon(
                  Icons.favorite_border_outlined,
                ),

              ),
            ],
          ),
        );
      }),
    );
  }
}
