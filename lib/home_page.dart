import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

userCreateStory(int index) {
  if (index == 0) {
    return RawMaterialButton(
      fillColor: Colors.white,
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minWidth: 23, maxWidth: 23),
      onPressed: () {},
      child: const Icon(
        Icons.add_circle,
        color: Colors.blue,
      ),
    );
  }
  return const SizedBox(
    width: 0,
  );
}

class _HomePageState extends State<HomePage> {
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

  Future<void> onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/Logo2.png",
          height: 35,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.near_me_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ...List.generate(
                      8,
                      (index) => Container(
                        height: 110,
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              backgroundImage: index == 0
                                  ? null
                                  : const AssetImage("images/story.png"),
                              child: CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(
                                  profileImages[index],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Align(
                                alignment: const Alignment(2.2, 0.6),
                                child: userCreateStory(index),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Profile Name",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              //Post Section
              Column(
                children: [
                  ...List.generate(
                    8,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Header Post
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundImage: AssetImage(
                                  profileImages[index],
                                ),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage: AssetImage(
                                    profileImages[index],
                                  ),
                                ),
                              ),
                            ),
                            const Text("Profile Name"),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        //Image Post
                        Image.asset(posts[index]),
                        //Footer Post
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chat_bubble_outline),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.near_me_outlined),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border_sharp),
                            ),
                          ],
                        ),
                        //Coments
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                    text: "10 likes",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Profile Name ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Image description text Image description text Image description text Image description text Image description text ",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "View all 22 comments",
                                      style: TextStyle(
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "September 6",
                                      style: TextStyle(
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}
