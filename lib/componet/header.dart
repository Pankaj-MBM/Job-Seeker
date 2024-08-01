import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuAppController.dart';
import '../responsive.dart';
import '../screens/profile/profile_view.dart';
import '../utils/ui_color_code.dart';
import '../utils/ui_helper.dart';
import 'my_container.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuAppController>().controlMenu,
            ),
          if (!Responsive.isMobile(context)) wSpace(),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileView(),
                    ));
              },
              child: Text(
                "Home",
                style: textStyleFonts18(context),
              )),
          wSpace(),
          TextButton(
              onPressed: () {},
              child: Text(
                "Contact Us",
                style: textStyleFonts18(context),
              )),
          wSpace(),
          TextButton(
              onPressed: () {},
              child: Text(
                "FAQ's",
                style: textStyleFonts18(context),
              )),
          wSpace(),
          const MyContainer(
              text: "Book a Demo",
              icon: Icon(Icons.search, color: AppColors.blackColor),
              color: Colors.transparent),
          wSpace(),
          const MyContainer(
              text: "Find a Candidate",
              icon: Icon(
                Icons.search,
                color: AppColors.blackColor,
              ),
              color: AppColors.bgButtonColor),
          wSpace(),
          const MyContainer(
              text: "Post New Job",
              icon: Icon(
                Icons.search,
                color: AppColors.blackColor,
              ),
              color: AppColors.bgButtonColor),
          wSpace(),
          /*if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 3 : 2),*/

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset("assets/svg/wallet.svg")),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text("0"),
                ),
              )
            ],
          ),
          wSpace(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                              "assets/svg/institute-placeholder.svg")),
                    ),
                  ),
                  hSpacer(mHeight: 5),
                  Text("0/1")
                ],
              ),
              wSpace(mWidth: 10),
              Text(
                "I>T.B.P. Public School",
                style: textStyleFonts22(context, colors: AppColors.wigthColor),
                maxLines: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
