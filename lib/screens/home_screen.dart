import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/navbar.dart';
import '../components/slider.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Navbar(),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Positioned.fill(
            child: SvgPicture.asset("assets/BG-Tx.svg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: kToolbarHeight + 15),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const EmptySpace.v4(multiple: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // child: Image.network(imgUrl, fit: BoxFit.cover, height: 100),
                          child: Image.asset("assets/profile.jpg", fit: BoxFit.cover, height: 100),
                        ),
                        const EmptySpace.v2(),
                        const SelectableText("Hi,I m Faiq", style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.w500
                        ),),
                        const EmptySpace.v2(),
                        const SelectableText("Building digital\n products, brands, and\nexperience.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                            height: 1,
                            fontWeight: FontWeight.w100
                          ),
                        ),
                        const EmptySpace.v3(),
                        Material(
                          // borderRadius: BorderRadius.circular(20),
                          shape: const RoundedRectangleBorder(side: BorderSide(color: AppColors.border)),
                          color: AppColors.primary,
                          child: InkWell(
                            onTap: () => null,
                            // borderRadius: BorderRadius.circular(20),
                            child: const Padding(
                              padding: EdgeInsets.all(18),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SelectableText("Download Resume", style: TextStyle(
                                    fontSize: 12,
                                  ),),

                                  Icon(Icons.download_outlined)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const EmptySpace.v4(),
                        const WorkSlider(),
                        // Custom Divider
                        const SizedBox(
                            width: 1000,
                            child: Divider(color: AppColors.border, thickness: .8,)
                        ),
                        const EmptySpace.v2(multiple: 20),
                        const SelectableText("Tell me about your\nnext project",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50,
                              height: 1,
                              fontWeight: FontWeight.w100
                          ),
                        ),
                        const EmptySpace.v3(),
                        Material(
                          // borderRadius: BorderRadius.circular(20),
                          shape: const RoundedRectangleBorder(side: BorderSide(color: AppColors.border)),
                          color: AppColors.primary,
                          child: InkWell(
                            onTap: () => null,
                            // borderRadius: BorderRadius.circular(20),
                            child: const Padding(
                              padding: EdgeInsets.all(18),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SelectableText("Get in touch\t", style: TextStyle(
                                    fontSize: 12,
                                  ),),

                                  Icon(Icons.mail_outline_outlined )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const EmptySpace.v4(multiple: 20),
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: AppColors.border,  width: 1.5)),
                            ),
                            alignment: Alignment.center,
                            width: 1000,
                            padding: const EdgeInsets.symmetric(vertical: 20).copyWith(bottom: 0),
                            child: const Row(
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
                            ),
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