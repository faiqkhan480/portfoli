import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfoli/utils/size_config.dart';

import '../widgets/custom_fab.dart';
import 'experience.dart';
import 'projects.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 2);
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212224),
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              Center(
                child: Text('First Page'),
              ),
              Projects(),
              Experience(),
            ],
          ),

          Positioned(
            // bottom: 0,
            // top: 0,
            left: 20,
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
                  CustomFab(
                    icon: "assets/icons/user.png",
                    name: "Profile",
                    onTap: () => goto(0),
                    isSelected: selectedIndex == 0,
                  ),
                  const EmptySpace.v2(),
                  CustomFab(
                    icon: "assets/icons/smartphone.png",
                    name: "Work",
                    onTap: () => goto(1),
                    isSelected: selectedIndex == 1,
                  ),
                  const EmptySpace.v2(),
                  CustomFab(
                    icon: "assets/icons/briefcase.png",
                    name: "Experience",
                    isSelected: selectedIndex == 2,
                    onTap: () => goto(2),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void  goto(int index){
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
    setState(() {
      selectedIndex = index;
    });
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
