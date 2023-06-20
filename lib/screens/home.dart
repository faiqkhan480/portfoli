import 'package:flutter/material.dart';

import 'projects.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212224),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Center(
            child: Text('First Page'),
          ),
          Projects(),
          Center(
            child: Text('Third Page'),
          ),
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: previousPage,
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: nextPage,
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }

  void nextPage(){
    _pageController.animateToPage((_pageController.page?.toInt() ?? 0) + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }

  void previousPage(){
    _pageController.animateToPage((_pageController.page?.toInt() ?? 0) - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }

}
