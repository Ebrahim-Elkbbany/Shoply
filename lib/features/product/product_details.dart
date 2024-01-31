import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/models/products_model.dart';
import 'logic_prov.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.details});

  late final ProductModel details;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, help count, child) {
      return Scaffold(
        backgroundColor: const Color(0xfff3f3f3),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  width: 415,
                  height: 380,
                  child: Image.network(details.image)),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    details.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(width: 100),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black38,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black38,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Color(0xffEFAD5F),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black38,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Color(0xffb97869),
                              ),
                            ],
                          ),
                        ],
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
                    width: 25,
                  ),
                  Text(
                    details.price,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
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
                    style: const TextStyle(color: Colors.black38, fontSize: 30),
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
                    details.rating.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(details.rating.count.toString()),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(details.description),
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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(280.0, 50.0)),
                        maximumSize: MaterialStateProperty.all<Size>(
                            const Size(300.0, 60.0)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
