import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../cart/logic/sql_cart.dart';
import '../cart/logic/sql_provider.dart';
import '../layout/layout_view.dart';


class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({Key? key}) : super(key: key);

  @override
  State<FavouriteProducts> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavouriteProducts> {
  List <SQLModel> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LayoutView()));
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)
          ),
          title: const Text('Favourite Products'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<SQLModel>>(
            future: CartProvider.instance.getAllCart(),
            builder: (BuildContext context, snapshot) {
              if(snapshot.hasData) {
                products = snapshot.data!;
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 150 / 215,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
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
                                    const SizedBox(height: 10,),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.network(
                                        products[index].image,
                                        height: 170,
                                        width: 130,
                                        fit: BoxFit.cover,
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
                          ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
              }
              return const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        )
    );
  }
}