import 'package:flutter/material.dart';
import 'dart:math' as math;

// ignore: use_key_in_widget_constructors
class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> searchImages = [
    "images/profile1.jpg",
    "images/profile2.jpg",
    "images/profile3.jpg",
    "images/profile4.jpg",
    "images/profile5.jpg",
    "images/profile6.jpg",
    "images/profile7.jpg",
    "images/profile8.jpg",
    "images/post1.jpg",
    "images/post2.jpg",
    "images/post3.jpg",
    "images/post4.jpg",
    "images/post5.jpg",
    "images/post6.jpg",
    "images/post7.jpg",
    "images/post8.jpg",
    "images/post9.jpg",
  ];

  int gridTotalItems = 18;

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
              gridTotalItems = 18;
            });
          } else {
            setState(() {
              gridTotalItems += 6;
            });
          }
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
          //Top Search Bar
          SliverAppBar(
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                contentPadding: const EdgeInsets.all(10),
                filled: true,
                fillColor: const Color.fromRGBO(220, 220, 220, 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          //Infinite Generator
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Image.asset(
                  searchImages[(math.Random().nextInt(searchImages.length))],
                  fit: BoxFit.cover,
                );
              },
              childCount: gridTotalItems,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
