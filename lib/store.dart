import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:visibility_detector/visibility_detector.dart';

// ignore: use_key_in_widget_constructors
class Store extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
  final bool _searchBarIs = true;
  final _controller = ScrollController();
  final sliverAppBarKey = const Key("searchBarIs");

  Widget dinamicTittle<bool>() {
    if (_searchBarIs) {
      return const Text(
        'Shop',
        style: TextStyle(color: Colors.black),
      );
    } else {
      return TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search shops",
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: const Color.fromRGBO(220, 220, 220, 1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

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
              gridTotalItems = 6;
            });
          } else {
            setState(() {
              gridTotalItems += 4;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: dinamicTittle(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            title: VisibilityDetector(
              key: sliverAppBarKey,
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _searchBarIs == false;
                } else {
                  setState(() {
                    _searchBarIs == true;
                  });
                }
              },
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search shops",
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
            bottom: PreferredSize(
              preferredSize: const Size(10, 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                  minimumSize: const Size(360, 35),
                ),
                onPressed: () {},
                child: const Text(
                  'Videos',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
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
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1,
            ),
          ),
          /*Container(
            height: 100,
            width: 50,
            color: Colors.green,
            child: const Text("data"),
          ),*/
        ],
      ),
    );
  }
}
