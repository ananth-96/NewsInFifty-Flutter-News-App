import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:news_app/view/newsPage.dart';
import 'package:news_app/view/top10news.dart';

class Bottomnav extends StatefulWidget {
  @override
  _Bottomnav createState() => _Bottomnav();
}

class _Bottomnav extends State<Bottomnav> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFF355070), // Optional: match your app theme
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                Newspage(),
              TopTen(),
            ],
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
          ),

          // Floating Bottom Navigation Bar
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color:  Color(0xFF355070),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: BottomBar(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  selectedIndex: _currentPage,
                  onTap: (int index) {
                    _pageController.jumpToPage(index);
                    setState(() => _currentPage = index);
                  },
                  items: <BottomBarItem>[
                    BottomBarItem(
                      icon: Icon(Icons.home,color: Colors.white,),
                      title: Text('Home'),
                      activeColor: Colors.white,
                      activeTitleColor: Colors.white,
                    ),
                    BottomBarItem(
                      icon: Icon(Icons.favorite,color: Colors.white,),
                      title: Text('Top 10'),
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
