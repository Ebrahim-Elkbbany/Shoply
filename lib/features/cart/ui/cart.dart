import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/cart/logic/cart_provider.dart';
import '../../layout/layout_view.dart';
import '../logic/sql_cart.dart';
import '../logic/sql_provider.dart';

class Cart extends StatefulWidget {

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  double price = 0;

  List <SQLModel> products = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProviderr(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LayoutView()));
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)
          ),
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 500,
                    child: FutureBuilder<List<SQLModel>>(
                      future: CartProvider.instance.getAllCart(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          products = snapshot.data!;
                          return ListView.builder(
                              itemCount: products.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 20,),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            child: Image.network(
                                              products.elementAt(index).image,
                                              height: 116, width: 112,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 25,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  products.elementAt(index).title,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 17
                                                  ),
                                                ),
                                                width: 120,
                                              ),
                                              const SizedBox(height: 10,),
                                              Text.rich(
                                                  TextSpan(
                                                      text: '\$',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' ${products.elementAt(index).price}',
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16
                                                          ),
                                                        )
                                                      ]
                                                  )

                                              ),
                                              const SizedBox(height: 25,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Colors.grey
                                                    ),
                                                    height: 40, width: 40,
                                                    child: Consumer<
                                                        CartProviderr>(
                                                        builder: (context,
                                                            cartProvider,
                                                            child) {
                                                          return IconButton(
                                                            onPressed: () {
                                                              cartProvider
                                                                  .decrease();
                                                            },
                                                            icon: const Icon(
                                                              Icons.remove,
                                                              size: 20,),
                                                          );
                                                        }),

                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Consumer<CartProviderr>(
                                                      builder: (context,
                                                          cartProvider, child) {
                                                        return Text(
                                                            '${cartProvider
                                                                .count}');
                                                      }),
                                                  const SizedBox(width: 10,),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(10),
                                                          color: Colors.grey
                                                      ),
                                                      height: 40, width: 40,
                                                      child: Consumer<
                                                          CartProviderr>(
                                                          builder: (context,
                                                              cartProvider,
                                                              child) {
                                                            return IconButton(
                                                              onPressed: () {
                                                                cartProvider
                                                                    .increase();
                                                              },
                                                              icon: const Icon(
                                                                Icons.add,
                                                                size: 20,),
                                                            );
                                                          })
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(width: 60,),
                                          IconButton(
                                            onPressed: () {
                                              CartProvider.instance.delete(products.elementAt(index).id);
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                                Icons.close_outlined),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                  ],
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
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your promo code',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 20),),
                      Consumer<CartProviderr>(builder: (context, cartProvider,child) {
                        return Text('\$ 204.23', style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),);
                      }),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: 500, height: 50,
                    decoration: const BoxDecoration(
                    ),
                    child: ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                        ),
                        child: const Text('Check out', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
