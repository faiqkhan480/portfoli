import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marqueer/marqueer.dart';

import '../utils/app_colors.dart';

List<String> logos = [
  "assets/logos/black.png",
  "assets/logos/android.png",
  "assets/logos/firebase.png",
  "assets/logos/dart.png",
  "assets/logos/flutter.png",
  "assets/logos/flutter_comunity.png",
  // "assets/logos/KakaoTalk_Photo_2021-05-12-11-18-13.png",
  "assets/logos/riverpod.png"
];

List<String> images = [
  "brands/boltshift.svg",
  "brands/class_pass.svg",
  "brands/cocacola.svg",
  "brands/lightbox.svg",
  "brands/mattered.svg",
  "brands/nation_bank.svg",
  "brands/subway.svg",
];

class WorkSlider extends StatelessWidget {
  final MarqueerController? marqueeController;
  const WorkSlider({super.key, this.marqueeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          border: Border(
              top: BorderSide(color: AppColors.border),
              bottom: BorderSide(color: AppColors.border)
          )
      ),
      height: 150,
      // padding: const EdgeInsets.symmetric(vertical: 40),
        child: Marqueer(
          controller: marqueeController,
          padding: const EdgeInsets.symmetric(vertical: 40),
          autoStart: true,
          autoStartAfter: const Duration(milliseconds: 350),
          pps: 100,
          infinity: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(logos.length, (index) => Image.asset(
              logos.elementAt(index),
              width: MediaQuery.of(context).size.width *.20,
              color: index == 0 || index == 1 ? AppColors.secondary : AppColors.primary,
              colorBlendMode: index == 0 || index == 1 ? null : BlendMode.saturation,
            )),
          ),
        )
      //   child: Marqueer.builder(
      //     controller: marqueeController,
      //     itemCount: logos.length,
      //     padding: const EdgeInsets.symmetric(vertical: 40),
      //     autoStart: true,
      //     autoStartAfter: const Duration(milliseconds: 350),
      //     // restartAfterInteractionDuration: const Duration(milliseconds: 350),
      //     pps: 100,
      //     itemBuilder: (context, index) {
      //       return Image.asset(
      //         logos.elementAt(index),
      //         width: MediaQuery.of(context).size.width * .20,
      //         color: index == 0 || index == 1 ? AppColors.secondary : AppColors.primary,
      //         colorBlendMode: index == 0 || index == 1 ? null : BlendMode.saturation,
      //       );
      //     },
      //   )
    );
  }
}
