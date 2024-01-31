import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List imagesList = [
    'https://timberchic.com/cdn/shop/products/VXcgwu3JSVe4cdD4JnPf_freestone_2.png?v=1620666247',
    'https://www.stikwood.com/cdn/shop/files/StikwoodReclaimedSierraSilverMasterBedroomAccentWall.png?v=1690402509',
    'https://m.media-amazon.com/images/I/81ADqF6FfFL._AC_UF350,350_QL80_.jpg'
  ];

  List imagesTitle = [
    'Minimal Stand',
    'Coffee Table',
    'Minimal Desk'
  ];

  List prices = [
    '\$25.00',
    '\$50.00',
    '\$60.00'
  ];


  int counter = 0;

  void _increment(){

    setState(() {
      if(counter>=0&&counter<10) {
        counter++;
      }
    });
  }
  void _decrement() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }
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
                    child: ListView.builder(
                      itemCount: imagesList.length,
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
                                    imagesList[index],
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
                                      imagesTitle[index],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17
                                      ),
                                    ),
                                    const SizedBox(height: 4,),
                                    Text(
                                      prices[index],
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
                                          child: IconButton(
                                            onPressed: _decrement,
                                            icon: const Icon(Icons.remove, size: 20,),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text('$counter',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey
                                          ),
                                          height: 40, width: 40,
                                          child: IconButton(
                                            onPressed: _increment,
                                            icon: const Icon(Icons.add, size: 20,),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(width: 65,),
                                IconButton(
                                  onPressed: () {
                                    imagesList.removeAt(index);
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