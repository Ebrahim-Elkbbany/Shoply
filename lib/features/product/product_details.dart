import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              width: 415,
              height: 380,
              child: const Image(
                image: NetworkImage(
                    "https://www.thaqafnafsak.com/wp-content/uploads/2022/03/4-12.jpg"),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Chairs",
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
                const Text(
                  "\$ 50",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
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
                  count.toString(),
                  style: const TextStyle(color: Colors.black38, fontSize: 30),
                ),
                const SizedBox(
                  width: 1,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 40,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            const Row(
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
                  "4.5",
                  style: TextStyle(fontSize: 20),
                ),
                Text("  (50 Review)"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Minimal Stand is made of by natural wood. The design that is very simple and minimal.This is truly one of the best furnitures in any family for now. with 3 different colors, you can easily select the best match for your home."),
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
        const SizedBox(width: 40,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.black),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(280.0, 50.0)),
                      maximumSize: MaterialStateProperty.all<Size>(const Size(300.0, 60.0)),
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
  }
}
