import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoli/utils/app_colors.dart';
import 'package:portfoli/utils/constant.dart';

import '../utils/size_config.dart';

class MyWorks extends StatelessWidget {
  const MyWorks({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width >= Constant.screenWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200.0),
      child: Column(
        children: [
          SelectableText("Some of my works",
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
                fontSize: 50,
                height: 1,
                fontWeight: FontWeight.w300
            ),
          ),
          const EmptySpace.v4(),
          SizedBox(
            height: MediaQuery.of(context).size.height * (isWeb ? .40 : .60),
            width: Constant.screenWidth,
            child: GridView.extent(
              maxCrossAxisExtent: isWeb ? 300 : 350,
              childAspectRatio: isWeb ? .65 : .75,
              padding: EdgeInsets.zero,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(data.length, (index) => Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    border: Border.all(color: AppColors.border)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SelectableText(data.elementAt(index).title ?? "",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.outfit(
                          fontSize: 22,
                          height: 1,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const EmptySpace.v3(),
                    SelectableText(data.elementAt(index).description ?? "",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.outfit(
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
          if(false)
          SizedBox(
            height: MediaQuery.of(context).size.height * .40,
            width: Constant.screenWidth,
            child: Row(
              children: List.generate(data.length, (index) => Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          border: Border.all(color: AppColors.border)
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(left: index == 0 ? 0 : null, right: index == (data.length - 1) ? 0 : null),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(data.elementAt(index).title ?? "",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.outfit(
                                fontSize: 22,
                                height: 1,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const EmptySpace.v3(),
                          SelectableText(data.elementAt(index).description ?? "",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.outfit(
                                fontSize: 16,
                                height: 1,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: index == 0 ? 2 : 1,
                      right: index == (data.length - 1) ? 5 : 1,
                      top: 2,
                      child: Image.network("https://play-lh.googleusercontent.com/CqafEMAY-M6_Qn5hPMuFytrJLwuAi4tMqv0Ck6-ntksrjqXEt8nCjgJvWiKphzCAyxI=w2560-h1440-rw",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * .20,),
                    )
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}