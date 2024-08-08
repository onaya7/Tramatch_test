// lib/main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:tramatch_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tramatch_test/features/task/presentation/bloc/task_bloc.dart';

import 'core/device/routes/routes_generator.dart';
import 'core/device/routes/routes_manager.dart';
import 'core/device/themes/themes.dart';
import 'core/injection/sl.dart';
import 'features/auth/presentation/bloc/auth_state.dart';
import 'utils/helpers/helpers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt.call<AuthBloc>()),
        BlocProvider<TaskBloc>(create: (context) => getIt.call<TaskBloc>()),
      ],
      child: DevicePreview(
        enabled: kReleaseMode,
        builder: (context) {
          return ToastificationWrapper(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  Helpers.showToast('error', state.message);
                } else if (state is AuthUnauthenticated) {
                  Helpers.showToast('error', state.message);
                }
              },
              builder: (context, state) {
                return MaterialApp(
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  theme: Themes.lightTheme,
                  darkTheme: Themes.darkTheme,
                  onGenerateRoute: RoutesGenerator.onGenerateRoute,
                  initialRoute: state is AuthAuthenticated
                      ? RoutesManager.tasklistRoute
                      : RoutesManager.splashRoute,
                  navigatorKey: Helpers.navigatorKey,
                );
              },
            ),
          );
        },
      ),
    );
  }
}


// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:toastification/toastification.dart';
// import 'package:tramatch_test/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:tramatch_test/features/task/presentation/bloc/task_bloc.dart';

// import 'core/device/routes/routes_generator.dart';
// import 'core/device/routes/routes_manager.dart';
// import 'core/device/themes/themes.dart';
// import 'core/injection/sl.dart';
// import 'utils/helpers/helpers.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthBloc>(
//           create: (context) => getIt.call<AuthBloc>(),
//         ),
//         BlocProvider<TaskBloc>(
//           create: (context) => getIt.call<TaskBloc>(),
//         ),
//       ],
//       child: DevicePreview(
//         enabled: kReleaseMode,
//         builder: (context) {
//           return ToastificationWrapper(
//             child: MaterialApp(
//               locale: DevicePreview.locale(context),
//               builder: DevicePreview.appBuilder,
//               debugShowCheckedModeBanner: false,
//               themeMode: ThemeMode.light,
//               theme: Themes.lightTheme,
//               darkTheme: Themes.darkTheme,
//               onGenerateRoute: RoutesGenerator.onGenerateRoute,
//               initialRoute: RoutesManager.splashRoute,
//               navigatorKey: Helpers.navigatorKey,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
