import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoply/core/utils/colors.dart';
import 'package:shoply/features/cart/logic/cart_provider.dart';

import '../../layout/layout_view.dart';

class Cart extends StatefulWidget {

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<String> imageList = [
    'https://m.media-amazon.com/images/I/81ADqF6FfFL._AC_UF350,350_QL80_.jpg',
    'https://www.digsdigs.com/photos/2019/04/02-a-modern-farmhouse-bedroom-with-a-statement-neutral-colored-shiplap-wall-that-adds-coziness-and-helps-to-pull-off-the-style.jpg',
    'https://www.dakotatimberco.com/cdn/shop/products/0I0A7001_1_2048x.jpg?v=1676310238',
    'https://m.media-amazon.com/images/I/81ADqF6FfFL._AC_UF350,350_QL80_.jpg'
  ];

  List titles = [
    'Alahy room',
    'Liverpool room',
    'Elgamal room',
    'Alahy room',
  ];

  List<double> prices = [
    2000,
    2500,
    5000,
    6000
  ];

  int count = 0;

  double price = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProvider(),
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
                    child: ListView.builder(
                        itemCount: imageList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {

                          price += prices[index];
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 20,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        imageList[index],
                                        height: 116, width: 112,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 25,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          titles[index],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 17
                                          ),
                                        ),
                                        const SizedBox(height: 4,),
                                        Text(
                                          '${prices[index]}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          ),
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
                                              child: Consumer<CartProvider>(builder: (context, cartProvider,child) {
                                                return IconButton(
                                                  onPressed: () {
                                                    cartProvider.decrease();
                                                  },
                                                  icon: const Icon(Icons.remove, size: 20,),
                                                );
                                              }),

                                            ),
                                            const SizedBox(width: 10,),
                                            Consumer<CartProvider>(builder: (context, cartProvider,child) {
                                              return Text('${cartProvider.count}');
                                            }),
                                            const SizedBox(width: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey
                                              ),
                                              height: 40, width: 40,
                                              child: Consumer<CartProvider>(builder: (context, cartProvider,child) {
                                                return IconButton(
                                                  onPressed: () {
                                                    cartProvider.increase();
                                                  },
                                                  icon: const Icon(Icons.add, size: 20,),
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
                                        imageList.removeAt(index);
                                        setState(() {
                                        });
                                      },
                                      icon: const Icon(Icons.close_outlined),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        }),
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
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 20),),
                      Consumer<CartProvider>(builder: (context, cartProvider,child) {
                        return Text(cartProvider.calcTotal(price).toString(), style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),);
                      }),
                    ],
                  ),
                  SizedBox(height: 15,),
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