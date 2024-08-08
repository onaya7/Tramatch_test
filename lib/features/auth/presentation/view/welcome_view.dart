import 'package:flutter/material.dart';
import 'package:tramatch_test/componenets/custom_scaffold.dart';
import 'package:tramatch_test/core/device/sizes/sizes.dart';
import 'package:tramatch_test/gen/assets.gen.dart';
import 'package:tramatch_test/utils/helpers/helpers.dart';

import '../../../../componenets/custom_button.dart';
import '../../../../core/device/routes/routes_manager.dart';
import '../../../../utils/constants/color_constants.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        statusBarColor: ColorConstants.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorConstants.white,
        body: SafeArea(
          child: Container(
            color: ColorConstants.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 35,
                      right: 60,
                      bottom: 0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Welcome to',
                            style: TextStyle(
                              color: ColorConstants.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Assets.json.bookreveal.lottie(
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                            repeat: false,
                          ),
                          const Text(
                            'TraTask',
                            style: TextStyle(
                              color: ColorConstants.primary,
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'A place where you can stay on top of your task.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstants.grey700,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: Sizes.screenWidth(context),
                  padding: const EdgeInsets.only(left: 35, right: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Let\'s Get Started...',
                        style: TextStyle(
                          color: ColorConstants.grey700,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomButton(
                        text: 'Next',
                        textColor: ColorConstants.white,
                        backgroundColor: ColorConstants.primary,
                        onPressed: () =>
                            Helpers.navigateToPage(RoutesManager.signInRoute),
                        isLoading: false,
                        hasSuffixIcon: true,
                        iconPath: Assets.icons.chevronRight.path,
                        iconColor: ColorConstants.white,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
