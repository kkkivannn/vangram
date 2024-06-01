import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController _pageController;

  late final ValueNotifier<int> _pageNotifier;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _pageNotifier.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _pageNotifier,
      builder: (_, value, __) {
        return Scaffold(
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: value == 0
                  ? AppColors.kSecondaryColor
                  : value == 1
                      ? const Color(0xffFF4F14)
                      : AppColors.kPrimaryColor,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: context.heightScreen - 150,
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 10,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (value) => _pageNotifier.value = value,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              SafeArea(
                                bottom: false,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        flex: 15,
                                        child: SvgPicture.asset(
                                          Assets.icons.shareMoment,
                                        ),
                                      ),
                                      const Text(
                                        'Делитесь своими моментами',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              SafeArea(
                                bottom: false,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        flex: 15,
                                        child: SvgPicture.asset(
                                          Assets.icons.shareWithFriends,
                                        ),
                                      ),
                                      const Text(
                                        'Обсуждайте их с друзьями',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              SafeArea(
                                bottom: false,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        flex: 15,
                                        child: SvgPicture.asset(
                                          Assets.icons.likeMe,
                                        ),
                                      ),
                                      const Text(
                                        'Оценивайте себя и других',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => AnimatedContainer(
                              height: 10,
                              width: value == index ? 27 : 10,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: value == index
                                    ? value == 0
                                        ? AppColors.kSecondaryColor
                                        : value == 1
                                            ? const Color(0xffFF4F14)
                                            : AppColors.kPrimaryColor
                                    : Colors.grey[350],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (value == 2) {
                        context.pushReplacementNamed(Routes.authorization);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ).copyWith(bottom: 10),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.kWhiteColor,
                      ),
                      child: Center(
                        child: Text(
                          'Далее',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
