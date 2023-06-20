import 'package:flutter/material.dart';
import 'package:portfoli/utils/size_config.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF343639),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: const Color(0xFF44474b))
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: previousPage,
                hoverColor: Colors.black,
                color: Colors.white,
                iconSize: 30,
                padding: const EdgeInsets.all(20),
                icon: const Icon(Icons.arrow_back),
              ),
              const EmptySpace.v2(),
              IconButton(
                onPressed: nextPage,
                hoverColor: Colors.black,
                color: Colors.white,
                iconSize: 30,
                padding: const EdgeInsets.all(20),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
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
