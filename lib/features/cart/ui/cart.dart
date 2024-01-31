import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/logic_prov.dart';
import '../logic/sql_provider.dart';

class Cart extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const Cart({required this.image,required this.title, required this.price,super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List products = [];

  TextEditingController promoCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_sharp)
        ),
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 550,
                    child: FutureBuilder(
                      future: CartProvider.instance.getAllCart(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        return ListView.builder(
                            itemCount: products.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
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
                                            widget.image,
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
                                              widget.title,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 17
                                              ),
                                            ),
                                            const SizedBox(height: 4,),
                                            Text(
                                              widget.price,
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
                                                  child: Consumer<help>(builder: (context, help, child) {
                                                    return IconButton(
                                                      onPressed: () {
                                                        help.decrease();
                                                      },
                                                      icon: const Icon(Icons.remove, size: 20,),
                                                    );
                                                  }),

                                                ),
                                                const SizedBox(width: 10,),
                                                Consumer<help>(builder: (context, help , child) {
                                                  return Text('${help.count}');
                                                }
                                                ),
                                                const SizedBox(width: 10,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.grey
                                                  ),
                                                  height: 40, width: 40,
                                                  child: Consumer<help>(builder: (context, help, child) {
                                                    return IconButton(
                                                      onPressed: () {
                                                        help.increase();
                                                      },
                                                      icon: const Icon(Icons.add, size: 20,),
                                                    );
                                                  }),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 65,),
                                        IconButton(
                                          onPressed: () {
                                            products.removeAt(index);
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
                            });
                      },
                    ),
                  ),
                  TextField(
                    controller: promoCode,
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
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: TextStyle(fontSize: 20),),
                      Text('\$95.00', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  const SizedBox(height: 20,),
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