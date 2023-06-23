import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../components/footer.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = 800;
    ScrollController scrollController = ScrollController();

    return WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: SizedBox(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SelectableText(
                  "Work Experience",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.dmSans(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const EmptySpace(multiple: 3),
                const Divider(height: 50, color: AppColors.secondary, thickness: .3,),
                SelectableText(
                  "Let’s collaborate on a new project!",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.dmSans(
                      fontSize: 22,
                      height: 1,
                      color: const Color(0xFF7C7C7C),
                      fontWeight: FontWeight.w400
                  ),
                ),
                const EmptySpace(multiple: 10),
                company(),
                const EmptySpace(multiple: 10),
                company(),
                const EmptySpace(multiple: 10),
                company(),
                const EmptySpace(multiple: 10),

                const Divider(height: 50, color: AppColors.secondary, thickness: .3,),
                const Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget company() {
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
