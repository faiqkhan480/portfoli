import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/footer.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';
import '../widgets/scroll_wrapper.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  // int selectedOffset = 0;
  // bool selected = false;

  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this)..addListener(() =>
        setState(() {}));
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this)
      ..addListener(() =>
        setState(() {}));
    controller3 = AnimationController(
        duration: const Duration(milliseconds: 350), vsync: this)..addListener(() =>
        setState(() {}));
    animation1 = Tween(begin: 0.0, end: -10.0).animate(controller1);
    animation2 = Tween(begin: 0.0, end: -10.0).animate(controller2);
    animation3 = Tween(begin: 0.0, end: -10.0).animate(controller3);
  }


  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = SizeConfig.screenWidth < 600;

    return ScrollWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title(),
          const EmptySpace(multiple: 6),
          links(),
          const EmptySpace(multiple: 4),
          Center(
            child: SizedBox(
              width: SizeConfig.screenWidth * .75,
              child: SelectableText(
                "My name is Faique Saeed and I am a UI Designer from Bulgaria with a passion for creating exceptional SaaS, Design Systems & NoCode Development.",
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSans(
                    fontSize: SizeConfig.textMultiplier * 2.4,
                    // height: 1,
                    color: const Color(0xFF7C7C7C),
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
          const EmptySpace(multiple: 3),
          const Divider(height: 50, color: AppColors.secondary, thickness: .3,),
          const EmptySpace(multiple: 10),
          education(),
          const EmptySpace(multiple: 10),
          education(),
          const EmptySpace(multiple: 10),
          education(),
          const EmptySpace(multiple: 10),
          const Divider(height: 50, color: AppColors.secondary, thickness: .3,),
          const Footer()
        ],
      ),
    );
  }

  // Main title of portfoli...
  Widget title() {
    bool isMobile = true;
    if(isMobile) {
      return Column(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset("assets/profile.jpg", fit: BoxFit.cover, height: SizeConfig.screenHeight * .15),
            ),
          ),
          const EmptySpace.v2(),
          RichText(
              text: TextSpan(
                  style: GoogleFonts.dmSans(
                      fontSize: SizeConfig.textMultiplier * 5,
                      color: Colors.white,
                      letterSpacing: -2,
                      fontWeight: FontWeight.w700
                  ),
                  children: [
                    const TextSpan(text: "Hey, I’m Faiq\na"),
                    TextSpan(text: " Flutter Developer.", style: GoogleFonts.dmSans(
                        color: const Color(0xFF6f6f6f)
                    ),),
                  ]
              )
          ),
        ],
      );
    }
    return Row(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset("assets/profile.jpg", fit: BoxFit.cover, height: 160),
          ),
        ),
        const EmptySpace.h3(),
        Flexible(
          child: RichText(
              text: TextSpan(
                  style: GoogleFonts.dmSans(
                      fontSize: 70,
                      color: Colors.white,
                      letterSpacing: -4,
                      fontWeight: FontWeight.w700
                  ),
                  children: [
                    const TextSpan(text: "Hey, I’m Faiq\na"),
                    TextSpan(text: " Flutter Developer.", style: GoogleFonts.dmSans(
                        color: const Color(0xFF6f6f6f)
                    ),),
                  ]
              )
          ),
        ),
      ],
    );
  }

  // Links button for social contact...
  Widget links() {
    bool isMobile = SizeConfig.screenWidth < 600;
    if(isMobile) {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) => Transform.translate(
          offset: Offset(0.0, index == 0 ? animation1.value : index == 1 ? animation2.value : animation3.value),
          // offset: Offset(0.0, index == selectedOffset && selected  ? 0 : 20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: index == 0 ? 0 : null),
            child: InkWell(
              onTap: () => null,
              onHover: (value) {
                if(value) {
                  switch(index) {
                    case 0:
                      controller1.forward();
                      break;
                    case 1:
                      controller2.forward();
                      break;
                    case 2:
                      controller3.forward();
                      break;
                  }
                }
                else {
                  switch(index) {
                    case 0:
                      controller1.reverse();
                      break;
                    case 1:
                      controller2.reverse();
                      break;
                    case 2:
                      controller3.reverse();
                      break;
                  }
                }
              },
              splashColor: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(50),
              child: Ink(
                decoration: BoxDecoration(
                    color: AppColors.buttonBackGround,
                    borderRadius: BorderRadius.circular(50)
                ),
                width: SizeConfig.screenWidth * .70,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(index == 0 ? "assets/icons/mail.png" : index == 1 ? "assets/icons/linkedin.png" : "assets/icons/github.png",
                      color: Colors.white,
                      height: SizeConfig.screenHeight * .03,
                    ),
                    const EmptySpace.h2(),
                    Text(
                      index == 0 ? "Email" : index == 1 ? "LinkedIn" : "Github",
                      style: GoogleFonts.dmSans(
                          fontSize: SizeConfig.textMultiplier * 3,
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      );
    }
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) => Transform.translate(
        offset: Offset(0.0, index == 0 ? animation1.value : index == 1 ? animation2.value : animation3.value),
        // offset: Offset(0.0, index == selectedOffset && selected  ? 0 : 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(left: index == 0 ? 0 : null),
          child: InkWell(
            onTap: () => null,
            onHover: (value) {
              if(value) {
                switch(index) {
                  case 0:
                    controller1.forward();
                    break;
                  case 1:
                    controller2.forward();
                    break;
                  case 2:
                    controller3.forward();
                    break;
                }
              }
              else {
                switch(index) {
                  case 0:
                    controller1.reverse();
                    break;
                  case 1:
                    controller2.reverse();
                    break;
                  case 2:
                    controller3.reverse();
                    break;
                }
              }
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF343639),
                  borderRadius: BorderRadius.circular(50)
              ),
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(index == 0 ? "assets/icons/mail.png" : index == 1 ? "assets/icons/linkedin.png" : "assets/icons/github.png",
                    color: Colors.white,
                    height: 25,
                  ),
                  const EmptySpace.h3(),
                  Text(
                    index == 0 ? "Email" : index == 1 ? "LinkedIn" : "Github",
                    style: GoogleFonts.dmSans(
                        fontSize: 22,
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget education() {
    final bool isMobile = SizeConfig.screenWidth < 600;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Years
            SelectableText(
              "2010 - 2015",
              textAlign: TextAlign.start,
              style: GoogleFonts.dmSans(
                  fontSize: 18,
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
              ),
            ),
            const EmptySpace.v2(),
            // Company Name
            SelectableText(
              "Company Name",
              textAlign: TextAlign.start,
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  height: 1,
                  color: const Color(0xFF7C7C7C),
                  fontWeight: FontWeight.w400
              ),
            ),
            const EmptySpace(),
            // City
            SelectableText(
              "City State",
              textAlign: TextAlign.start,
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  height: 1,
                  color: const Color(0xFF7C7C7C),
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
        const EmptySpace.h3(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Title
              SelectableText(
                "D & P design development",
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSans(
                    fontSize: 18,
                    height: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                ),
              ),
              const EmptySpace.v2(),
              // Job Description
              SelectableText(
                "Filler text is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text for testing, or to spoof an e-mail spam filter.",
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSans(
                    fontSize: 16,
                    height: 1,
                    color: const Color(0xFF7C7C7C),
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
