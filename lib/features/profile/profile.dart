import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: const Color(0xfff3f3f3),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarGlow(
                child: Material(
                  // Replace this child with your own
                  elevation: 8.0,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://tse1.mm.bing.net/th?id=OIP.VTBzGQySOYLDke_xg2OfEQHaFj&pid=Api&P=0&h=220"),
                    ),
                    radius: 50.50,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                children: [
                  Text(
                    "Mahmoud Sherif",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                    height: 10.0,
                  ),
                  Text(
                    "Mahmoudsherif@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 76,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "orders",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('my orders '),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 76,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Shopping",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 76,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('cards'),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 76,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('ccomments'),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 76,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Setting",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('password'),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
