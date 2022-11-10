import 'package:flutter/material.dart';
import 'dart:math' as math;

// ignore: use_key_in_widget_constructors
class ReelsPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  int numberOfReels = 2;

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

  titleReels(index) {
    if (index == 0) {
      return const Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Reels',
          style: TextStyle(
            decorationThickness: 2,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }
/*
  final _controller = PageController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _controller.addListener(
      () {
        if (_controller.position.atEdge) {
          bool isTop = _controller.position.pixels == 0;
          if (isTop) {
            setState(() {
              numberOfReels = 2;
            });
          }
          print("listener $numberOfReels");
        }
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //controller: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          setState(() {
            index == 0 ? numberOfReels = 2 : numberOfReels = index + 2;
            print("$index and $numberOfReels");
          });
        },
        children: <Widget>[
          ...List.generate(
            numberOfReels,
            (index) => Container(
              //color: Colors.green,
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    posts[math.Random().nextInt(8)],
                  ),
                ),
              ),
              child: Stack(
                children: [
                  titleReels(index),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '1,059',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Icon(
                          Icons.messenger_outline_sharp,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '18',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Icon(
                          Icons.near_me_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.density_medium_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(
                            profileImages[index],
                          ),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(
                              profileImages[math.Random().nextInt(8)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(
                                profileImages[index],
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  profileImages[math.Random().nextInt(8)],
                                ),
                              ),
                            ),
                            const Text(
                              ' User ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                    Colors.transparent,
                                  ),
                                  textStyle:
                                      ButtonStyleButton.allOrNull<TextStyle>(
                                    const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                child: const Text('Follow')),
                          ],
                        ),
                        const Text(
                          "Follow",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Audio",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      /*body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    posts[math.Random().nextInt(8)],
                    fit: BoxFit.cover,
                  ),
                );
              },
              childCount: numberOfReels,
            ),
          ),
          //SliverFillRemaining(child: Image.asset(posts[0],fit: BoxFit.cover,),)
        ],
      ),*/
    );
  }
}
