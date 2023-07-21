import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../utils/size_config.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    super.key,
    required this.name,
    required this.icon,
    this.isSelected = false,
    this.onTap
  });

  final String name;
  final String icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool isMobile = SizeConfig.screenWidth < 600;
    return JustTheTooltip(
      borderRadius: BorderRadius.circular(50),
      backgroundColor: Colors.white,
      preferredDirection: AxisDirection.left,
      tailBuilder: (Offset tip, Offset point2, Offset point3) => Path()
        ..moveTo(tip.dx, tip.dy)
        ..lineTo(point2.dx, point2.dy)
        ..lineTo(point3.dx, point3.dy)
        ..close(),
      content: isSelected ? const SizedBox.shrink() : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(name, style: GoogleFonts.dmSans(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600
        )),
      ),
      child: IconButton(
        onPressed: onTap,
        hoverColor:  isSelected ? null : Colors.black,
        color: Colors.white,
        style: IconButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : null
        ),
        padding: EdgeInsets.all(isMobile ? 15 : 25),
        icon: Image.asset(
          icon, height: isMobile ? SizeConfig.screenHeight * .03 : 25,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
