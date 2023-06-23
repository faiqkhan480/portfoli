import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../components/my_works.dart';
import '../components/navbar.dart';
import '../components/slider.dart';
import '../utils/app_colors.dart';
import '../utils/constant.dart';
import '../utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MarqueerController marqueeController = MarqueerController();
  // Controllers
  late ScrollController _scrollController;


  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width >= Constant.screenWidth;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Navbar(),
      body: Stack(
        fit: StackFit.loose,
        children: [
          // Positioned.fill(
          //   child: SvgPicture.asset("assets/BG-Tx.svg",
          //     fit: BoxFit.cover,
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //   ),
          // ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: kToolbarHeight + 15),
                Flexible(
                  child: WebSmoothScroll(
                    controller: _scrollController,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      children: [
                        const EmptySpace.v4(multiple: 20),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            // child: Image.network(imgUrl, fit: BoxFit.cover, height: 100),
                            child: Image.asset("assets/profile.jpg", fit: BoxFit.cover, height: 200),
                          ),
                        ),
                        const EmptySpace.v2(),
                        const SelectableText("Hi,I m Faiq",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500
                        ),),
                        const EmptySpace.v2(),
                        ...commonWidget("Building digital\n products, brands, and\nexperience.", "Download Resume", const Icon(Icons.download_outlined)),
                        WorkSlider(marqueeController: marqueeController),
                        const MyWorks(),

                        // Custom Divider
                        const Center(
                          child: SizedBox(
                              width: Constant.screenWidth,
                              child: Divider(color: AppColors.border, thickness: .8,)
                          ),
                        ),
                        const EmptySpace.v2(multiple: 20),
                        ...commonWidget("Tell me about your\nnext project", "Get in touch\t", const Icon(Icons.mail_outline_outlined )),
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: AppColors.border,  width: 1.5)),
                            ),
                            alignment: Alignment.center,
                            width: 1000,
                            padding: const EdgeInsets.symmetric(vertical: 20).copyWith(bottom: 0),
                            child: isWeb ?
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectableText("© 2023 All rights reserved.", style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100
                                ),),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: SelectableText("Linkedin\t\t/", style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: SelectableText("Dribbble\t\t/", style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: SelectableText("Instagram", style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100
                                  ),),
                                )
                              ],
                            ) :
                            const SelectableText("© 2023 All rights reserved.", style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> commonWidget(String title, String buttonText, Widget icon) => [
  SelectableText(title,
    textAlign: TextAlign.center,
    style: GoogleFonts.dmSans(
        fontSize: 50,
        height: 1,
        fontWeight: FontWeight.w600
    ),
  ),
  const EmptySpace.v3(),
  Center(
    child: Material(
      // borderRadius: BorderRadius.circular(20),
      shape: const RoundedRectangleBorder(side: BorderSide(color: AppColors.border)),
      color: AppColors.primary,
      child: InkWell(
        onTap: () => null,
        // borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(buttonText, style: const TextStyle(
                fontSize: 12,
              ),),
              icon
            ],
          ),
        ),
      ),
    ),
  ),
  const EmptySpace.v4(multiple: 20)
];