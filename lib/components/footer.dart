import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/size_config.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = SizeConfig.screenWidth < 600;

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
      children: [
        const EmptySpace(multiple: 5),
        SelectableText(
          "Let's collaborate!",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.dmSans(
            letterSpacing: -2,
              fontSize: SizeConfig.textMultiplier * 4,
              color: Colors.white,
              fontWeight: FontWeight.w700
          ),
        ),
        if(isMobile)
          const EmptySpace.v4(),
        Align(
          alignment: isMobile ? Alignment.center :  Alignment.centerLeft,
          child: Material(
            color: const Color(0xFF343639),
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
                onTap: () => null,
                hoverColor: Colors.black,
                borderRadius: BorderRadius.circular(50),
                splashColor: Theme.of(context).colorScheme.inversePrimary,
                child: Ink(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  width: isMobile ? SizeConfig.screenWidth * .70 : null,
                  child: Text("Contact",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: SizeConfig.textMultiplier * 3,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),),
                )
            ),
          ),
        ),

        const EmptySpace(multiple: 4),
        if(isMobile)
          Column(
          children: [
            SelectableText(
              "©2023 Faiq Saeed",
              textAlign: TextAlign.start,
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  color: const Color(0xFF7C7C7C),
                  fontWeight: FontWeight.w400
              ),
            ),
            SelectableText(
              "·",
              style: GoogleFonts.dmSans(
                  fontSize: 30,
                  height: 1,
                  color: const Color(0xFF7C7C7C),
                  fontWeight: FontWeight.bold
              ),
            ),
            TextButton(
                onPressed: () => null,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                    textStyle: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    )
                ),
                child: const Text(
                   "Download CV",
                )
            )
            // SelectableText(
            //   "Download CV",
            //   style: GoogleFonts.dmSans(
            //       fontSize: 16,
            //       color: Colors.white,
            //       fontWeight: FontWeight.w400
            //   ),
            // ),
          ],
        )
        else
          Row(
            children: [
              SelectableText(
                "©2023 Faiq Saeed",
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSans(
                    fontSize: 16,
                    color: const Color(0xFF7C7C7C),
                    fontWeight: FontWeight.w400
                ),
              ),
              SelectableText(
                "·",
                style: GoogleFonts.dmSans(
                    fontSize: 30,
                    color: const Color(0xFF7C7C7C),
                    fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                  onPressed: () => null,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  child: const Text(
                    "Download CV",
                  )
              )
              // SelectableText(
              //   "Download CV",
              //   style: GoogleFonts.dmSans(
              //       fontSize: 16,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w400
              //   ),
              // ),
            ],
          ),
        const EmptySpace.v2(),
      ],
    );
  }
}
