import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  const WorkSlider({super.key});

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
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // children: List.generate(images.length, (index) => Expanded(child: SvgPicture.asset(images.elementAt(index)))),
        children: List.generate(logos.length, (index) => Image.asset(
          logos.elementAt(index),
          width: 100,
          color: index == 0 || index == 1 ? AppColors.secondary : AppColors.primary,
          colorBlendMode: index == 0 || index == 1 ? null : BlendMode.saturation,
        )),
      ),
    );
  }
}
