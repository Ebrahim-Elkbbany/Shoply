import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff3f3f3),
        title: const Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            const Text.rich(TextSpan(
                text: "Welcome to",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                      text: " Sh",
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink)),
                  TextSpan(
                      text: "OP",
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber)),
                  TextSpan(
                      text: "LY..               ",
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal)),
                  TextSpan(
                    text: "Your ultimate shopping companion!..",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  )
                ])),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "At Shoply, we believe in transforming the way you shop online, making it not just a transaction but an experience. Our app is crafted with passion and a commitment to delivering unparalleled convenience, variety, and joy to your shopping journey.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Who We Are:",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo),
            ),
            const Text(
              "  Ibrahim ELkabany.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.brown),
            ),
            const Text(
              "      Shaimaa Esaeed..",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green),
            ),
            const Text(
              "            Mohamed ELgamal...",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.deepPurple),
            ),
            const Text(
              "                   Mahmoud Sherif......",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.orange),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: const Text(
                "Contact us:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.redAccent),
              ),
            ),
            Text(
              "  Shoply@gmail.com",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black38),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "wish you good luck!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xffccb2c4)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
