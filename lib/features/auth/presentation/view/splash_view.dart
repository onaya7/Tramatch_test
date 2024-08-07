import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../componenets/custom_scaffold.dart';
import '../../../../core/device/routes/routes_manager.dart';
import '../../../../core/device/sizes/sizes.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/helpers/helpers.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      Helpers.navigateToPage(RoutesManager.welcomeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      statusBarColor: ColorConstants.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: ColorConstants.black,
      backgroundColor: ColorConstants.black,
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: Sizes.screenWidth(context),
                color: Colors.transparent,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'TraTask',
                      style: TextStyle(
                        color: ColorConstants.primary,
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(38),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorConstants.white,
                        ),
                        strokeWidth: 2.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
