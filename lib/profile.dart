import 'package:flutter/material.dart';
import 'dart:math' as math;

// ignore: use_key_in_widget_constructors
class Profile extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> profileImages = [
    "images/profile1.jpg",
    "images/profile2.jpg",
    "images/profile3.jpg",
    "images/profile4.jpg",
    "images/profile5.jpg",
    "images/profile6.jpg",
    "images/profile7.jpg",
    "images/profile8.jpg",
  ];

  List<String> posts = [
    "images/post1.jpg",
    "images/post2.jpg",
    "images/post3.jpg",
    "images/post4.jpg",
    "images/post5.jpg",
    "images/post6.jpg",
    "images/post9.jpg",
    "images/post7.jpg",
    "images/post8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main App Bar
      appBar: AppBar(
        title: const Text(
          'usuario',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // The User Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        profileImages[(math.Random().nextInt(8))],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Name LastName',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '10',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'post',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '51',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Follwers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '101',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //The 'Edit Profile' Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 35),
                  ),
                  onPressed: () {},
                  child: const Text('Edit Profile'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30, 35),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.person_add),
                ),
              ],
            ),
            // Discover People
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '  Discover people',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ...List.generate(
                    8,
                    (index) => Container(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                            width: 1,
                          ),
                        ),
                        height: 240,
                        width: 160,
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Icon(Icons.close),
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage(
                                    profileImages[index],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Profile Name",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black87),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "followed by... namea...",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black87),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(150, 35)),
                                  onPressed: () {},
                                  child: const Text('Follow'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Pictures Grids
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20.0),
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const TabBar(
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.grid_on,
                              color: Colors.black,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.person_pin_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 400,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                        child: TabBarView(
                          children: <Widget>[
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Image.asset(
                                  posts[(math.Random().nextInt(posts.length))],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Image.asset(
                                  posts[(math.Random().nextInt(posts.length))],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
