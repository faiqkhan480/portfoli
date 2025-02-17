// import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/footer.dart';
import '../utils/app_colors.dart';
import '../utils/constant.dart';
import '../utils/size_config.dart';
import '../widgets/scroll_wrapper.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = SizeConfig.screenWidth < 600;

    return ScrollWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectableText(
            "Projects",
            textAlign: TextAlign.start,
            style: GoogleFonts.dmSans(
                fontSize: 70,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),
          const EmptySpace(multiple: 6),
          const Divider(height: 50, color: AppColors.secondary, thickness: .3,),
          SelectableText(
            "All Projects",
            textAlign: TextAlign.start,
            style: GoogleFonts.dmSans(
                fontSize: 22,
                height: 1,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),
          const EmptySpace(multiple: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(data.length, (index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF343639)
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:[
                    Row(
                      children: [
                        if(data[index].appStoreLink?.isNotEmpty ?? false)
                          IconButton(
                            onPressed: () => goto(data[index].appStoreLink ?? ""),
                            hoverColor: Colors.white,
                            icon: const Icon(Icons.apple_rounded),
                        ),
                        if(data[index].playStoreLink?.isNotEmpty ?? false)
                          IconButton(
                          onPressed: () => goto(data[index].playStoreLink ?? ""),
                          icon: const Icon(Icons.android_rounded),
                          hoverColor: Colors.greenAccent,
                        ),
                      ],
                    ),
                    const EmptySpace(),
                    SelectableText(data.elementAt(index).title ?? "",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.dmSans(
                          fontSize: 18,
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const EmptySpace(),
                    SelectableText(data.elementAt(index).description ?? "",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.dmSans(
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 180,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(data[index].image ?? "",
                            fit: BoxFit.cover,
                          )
                      ),
                    )
                  ],
                ),
              )),
          ),
          const EmptySpace(multiple: 5),
          const Divider(height: 50, color: AppColors.secondary, thickness: .3,),
          const Footer()
        ],
      ),
    );
  }

  goto(String url) {
    // if(url.isNotEmpty) {
    //   html.window.open(url, 'new tab');
    // }

  }
}
