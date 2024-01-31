import 'package:flutter/material.dart';
import '../cart/logic/sql_cart.dart';
import '../cart/logic/sql_provider.dart';


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
        body: FutureBuilder<List<SQLModel>>(
          future: CartProvider.instance.getAllCart(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData) {
              products = snapshot.data!;
              return Card(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 25),
                    itemCount: products.length,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.network(products.elementAt(i).image),
                            Text(products.elementAt(i).title , style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      );
                    }),
              );
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
        )
    );
  }
}