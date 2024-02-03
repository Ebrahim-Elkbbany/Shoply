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
        centerTitle: true,
        title: Text(details.title),

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
                     padding: EdgeInsets.all(20),
                      height: 400,
                      child: Image.network(
                        details.image,fit: BoxFit.fill
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          details.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
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
                        width: 20,
                      ),
                      const Text(
                        "\$",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      ),
                      Text(
                        details.price.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            count.increase();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black45,
                            size: 40,
                          )),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        count.count.toString(),
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 30),
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
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 35,
                      ),
                      Text(
                        details.rating.rate.toString(),
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 20),
                    child: Text(
                      details.description,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                                  const Size(280.0, 60.0)),
                              maximumSize: MaterialStateProperty.all<Size>(
                                  const Size(300.0, 60.0)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Cart()));
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
