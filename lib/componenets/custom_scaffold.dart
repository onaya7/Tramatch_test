import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/color_constants.dart';

class CustomScaffold extends StatelessWidget {
  final Color? systemNavigationBarColor;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Brightness? systemNavigationBarIconBrightness;
  final Color? backgroundColor;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;

  const CustomScaffold({
    super.key,
    this.systemNavigationBarColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.systemNavigationBarIconBrightness,
    this.backgroundColor,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    // ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //       statusBarColor: themeProvider.statusBarColor,
    //       systemNavigationBarColor: themeProvider.systemNavigationBarColor,
    //       statusBarIconBrightness: themeProvider.statusBarIconBrightness,
    //       systemNavigationBarIconBrightness:
    //           themeProvider.systemNavigationBarIconBrightness,
    //     ),
    //   );
    // });

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? ColorConstants.white,
        systemNavigationBarColor:
            systemNavigationBarColor ?? ColorConstants.white,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
        systemNavigationBarIconBrightness:
            systemNavigationBarIconBrightness ?? Brightness.dark,
      ),
      child: Scaffold(
        key: key,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        drawerEnableOpenDragGesture: false,
        backgroundColor: backgroundColor ?? ColorConstants.white,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
