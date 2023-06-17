import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoli/utils/app_colors.dart';
import 'package:portfoli/utils/constant.dart';

import '../utils/size_config.dart';

List<MyData> data = [
  MyData.fromMap({"title": "UX UI", "description": "Designing interfaces that are intuitive, efficient, and enjoyable to use.", "icon": "",}),
  MyData.fromMap({"title": "Web & Mobile App", "description": "Transforming ideas into exceptional web and mobile app experiences.", "icon": "",}),
  MyData.fromMap({"title": "Design & Creative", "description": "Crafting visually stunning designs that connect with your audience.", "icon": "",}),
  MyData.fromMap({"title": "Development", "description": "Bringing your vision to life with the latest technology and design trends.", "icon": "",}),
];


class MyWorks extends StatelessWidget {
  const MyWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200.0),
      child: Column(
        children: [
          SelectableText("Collaborate with brands and agencies to\ncreate impactful results.",
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
              fontSize: 50,
              height: 1,
              fontWeight: FontWeight.w300
          ),
          ),
          const EmptySpace.v4(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .40,
            width: Constant.screenWidth,
            child: Row(
              children: List.generate(data.length, (index) => Expanded(
                child: Container(
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
              )),
            ),
          )
          // const EmptySpace.v3(),
        ],
      ),
    );
  }
}

class MyData {
  final String? title;
  final String? description;
  final String? icon;

  MyData({this.title, this.icon, this.description});

  factory MyData.fromMap(Map<String, dynamic> json) => MyData(
    title: json["title"],
    description: json["description"],
    icon: json["icon"],
  );
}