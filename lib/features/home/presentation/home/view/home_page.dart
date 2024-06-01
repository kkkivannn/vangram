import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required StatefulNavigationShell navigationShell})
      : _navigationShell = navigationShell,
        super(key: key);
  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.kWhiteColor,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        elevation: 0,
        onTap: (value) => _navigationShell.goBranch(value, initialLocation: true),
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              child: SvgPicture.asset(
                _navigationShell.currentIndex == 0 ? Assets.icons.filledCategory : Assets.icons.category,
                height: 30,
                colorFilter: ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: SvgPicture.asset(
                height: 30,
                _navigationShell.currentIndex == 1 ? Assets.icons.filledMessage : Assets.icons.message,
                colorFilter: ColorFilter.mode(
                  AppColors.kSecondaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: SvgPicture.asset(
                height: 30,
                _navigationShell.currentIndex == 2 ? Assets.icons.filledUser : Assets.icons.user,
                colorFilter: ColorFilter.mode(
                  AppColors.kThirdColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: SvgPicture.asset(
                height: 30,
                _navigationShell.currentIndex == 3 ? Assets.icons.filledSettings : Assets.icons.settings,
                colorFilter: ColorFilter.mode(
                  AppColors.kFourColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: "",
          ),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 10),
      //   child: SafeArea(
      //     top: false,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.grey[400]!,
      //             blurRadius: 2,
      //           ),
      //         ],
      //       ),
      //       child: ClipRRect(
      //         borderRadius: BorderRadius.circular(20),
      //         child:
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
