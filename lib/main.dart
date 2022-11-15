import 'package:flutter/material.dart';
import 'package:instagram_app/profile.dart';
import 'package:instagram_app/store.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'reels_page.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram App',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(40, 40, 40, 1),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          color: Colors.white,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  final mainPages = [HomePage(), SearchPage(), ReelsPage(), Store(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPages[currentPage],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
              icon: const Icon(
                Icons.home_filled,
              ),
              iconSize: currentPage == 0 ? 30 : 24,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
              icon: const Icon(
                Icons.search,
              ),
              iconSize: currentPage == 1 ? 30 : 24,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 2;
                });
              },
              icon: const Icon(
                Icons.ondemand_video,
              ),
              iconSize: currentPage == 2 ? 30 : 24,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
              ),
              iconSize: currentPage == 3 ? 30 : 24,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 4;
                });
              },
              icon: const Icon(
                Icons.person,
              ),
              iconSize: currentPage == 4 ? 30 : 24,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
