import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../../Aboutus/aboutus.dart';

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
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "orders",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
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
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "Shopping",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
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
                  SizedBox(height: 15,),
                  Container(
                    width: 350,
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "Favorite",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
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
                    height: 15,
                  ),

                  Container(
                    width: 350,
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
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
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "Setting",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
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
                  SizedBox(height: 15,),
                  Container(
                    width: 350,
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "Log out",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
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
                  SizedBox(height: 15,),
                  Container(
                    width: 350,
                    height: 50,
                    color: Colors.white70,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "About Us",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)
                              =>
                                  aboutus()
                              ));
                            },
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
