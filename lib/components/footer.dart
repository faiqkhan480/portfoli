import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/size_config.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const EmptySpace(multiple: 10),
        SelectableText(
          "Let's collaborate!",
          textAlign: TextAlign.start,
          style: GoogleFonts.outfit(
              fontSize: 80,
              color: Colors.white,
              fontWeight: FontWeight.w600
          ),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: const Color(0xFF343639),
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
                onTap: () => null,
                hoverColor: Colors.black,
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.black,
                child: Ink(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text("Contact",
                    style: GoogleFonts.outfit(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),),
                )
            ),
          ),
        ),

        const EmptySpace(multiple: 8),
        Row(
          children: [
            SelectableText(
              "©2023 Faiq Saeed",
              textAlign: TextAlign.start,
              style: GoogleFonts.outfit(
                  fontSize: 16,
                  color: const Color(0xFF7C7C7C),
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
        const EmptySpace.v2(),
      ],
    );
  }
}
