import 'package:flutter/material.dart';
import 'dart:math' as math;

// ignore: use_key_in_widget_constructors
class ReelsPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {

  int numberOfReels = 1;
  
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

  final _controller = ScrollController();

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
              numberOfReels = 1;
            });
          } else {
            setState(() {
              numberOfReels += 1;
            });
          }
          print(numberOfReels);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
      ),
    );

  }
}
