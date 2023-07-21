import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfoli/utils/size_config.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_fab.dart';
import 'experience.dart';
import 'profile.dart';
import 'projects.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  final bool isMobile = SizeConfig.screenWidth < 600;

  bool isMenu = false;

  handleMenu() {
    setState(() {
      isMenu = !isMenu;
    });
  }

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
              Profile(),
              Projects(),
              Experience(),
            ],
          ),

          if(isMobile && isMenu)
            Container(
              color: Colors.black.withOpacity(.6),
            ),

          if(isMobile)
            Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: handleMenu,
                  splashColor: Theme.of(context).colorScheme.inversePrimary,
                  child: Ink(
                    decoration: const BoxDecoration(
                      color: Colors.black
                    ),
                    height: 60,
                    child: Center(
                      child: SizedBox(
                        width: SizeConfig.screenWidth * .90,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 4,
                            ),
                            const EmptySpace(),
                            Text(
                              "Available for hire.",
                              style: GoogleFonts.dmSans(
                                  fontSize: SizeConfig.textMultiplier * 2,
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => null,
                              hoverColor:  Colors.grey,
                              color: Colors.white,
                              iconSize: 14,
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.buttonBackGround
                              ),
                              icon: const Icon(Icons.menu_rounded),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ),

          // if(!isMobile || isMenu)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
            // bottom: 0,
            // top: 0,
            left: (!isMobile || isMenu) ? 20 : -100,
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
    handleMenu();
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
