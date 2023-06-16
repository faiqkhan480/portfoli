import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

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
      child: Row(
        children: List.generate(images.length, (index) => Expanded(child: SvgPicture.asset(images.elementAt(index)))),
      ),
    );
  }
}
