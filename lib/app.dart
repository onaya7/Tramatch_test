import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'core/device/routes/routes_generator.dart';
import 'core/device/routes/routes_manager.dart';
import 'core/device/themes/themes.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'injection_container.dart';
import 'utils/helpers/helpers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<HomeBloc>(
          create: (context) => getIt.call<HomeBloc>(),
        ),
      ], child: 
        DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) {
            return ToastificationWrapper(
              child: MaterialApp(
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                theme: Themes.lightTheme,
                darkTheme: Themes.darkTheme,
                onGenerateRoute: RoutesGenerator.onGenerateRoute,
                initialRoute: RoutesManager.postRoute,
                navigatorKey: Helpers.navigatorKey,
              ),
            );
          }
        ),
    
    );
  }
}

