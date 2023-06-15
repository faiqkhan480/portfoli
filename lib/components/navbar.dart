import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border,  width: 1.5)),
        ),
        alignment: Alignment.center,
        width: 1000,
        // padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              // borderRadius: BorderRadius.circular(100),
              shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
              color: AppColors.primary,
              child: InkWell(
                onTap: () => null,
                borderRadius: BorderRadius.circular(100),
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Icon(Icons.mail_outline_outlined, size: 16),
                ),
              ),
            ),
            const EmptySpace.h2(),
            // CircleAvatar(
            //   radius: 30,
            //   backgroundColor: AppColors.primary,
            //   child: IconButton(
            //     // style: IconButton.styleFrom(
            //     //   backgroundColor: AppColors.primary,
            //     // ),
            //     onPressed: () => null,
            //     icon: const Icon(Icons.mail_outline_outlined),
            //   ),
            // ),
            const SelectableText("Get in touch", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300
            ),),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SelectableText("Linkedin\t\t/", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SelectableText("Dribbble\t\t/", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SelectableText("Instagram", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => const Size(200, kToolbarHeight + 15);
}