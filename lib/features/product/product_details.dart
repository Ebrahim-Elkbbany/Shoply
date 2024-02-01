import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/ui/cart.dart';
import '../home/models/products_model.dart';
import 'logic_prov.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.details});

  late final ProductModel details;

  TextEditingController image = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => help(),
        child: SingleChildScrollView(
          child: Consumer<help>(
            builder: (context, count, child) {
              return Column(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      width: 415,
                      height: 380,
                      child: Image.network(details.image)),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              details.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          ),
                          Text(
                            details.price.toString(),
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            count.increase();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black38,
                            size: 40,
                          )),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        count.count.toString(),
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 30),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      IconButton(
                        onPressed: () {
                          count.decrease();
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 40,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 40,
                      ),
                      Text(
                        details.rating.count.toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      details.description,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white70,
                          child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                size: 58,
                                color: Colors.grey,
                              ),
                              onPressed: () {}),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Consumer<help>(builder: (context, help, child) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(280.0, 50.0)),
                              maximumSize: MaterialStateProperty.all<Size>(
                                  const Size(300.0, 60.0)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cart(
                                          image: image.text,
                                          title: title.text,
                                          price: price.text)));
                            },
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
