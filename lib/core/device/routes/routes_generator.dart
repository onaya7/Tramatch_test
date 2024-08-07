import 'package:flutter/material.dart';
import 'package:tramatch_test/features/auth/presentation/view/signin_view.dart';
import 'package:tramatch_test/features/auth/presentation/view/signup_view.dart';
import 'package:tramatch_test/features/auth/presentation/view/splash_view.dart';
import 'package:tramatch_test/features/task/presentation/view/tasklist_page.dart';

import '../../../features/auth/presentation/view/welcome_view.dart';
import '../../../features/task/presentation/view/taskcreate_page.dart';
import '../../../features/task/presentation/view/taskdetail_page.dart';
import '../../../features/task/presentation/view/taskedit_page.dart';
import 'routes_manager.dart';
import 'undefined_route.dart';

class RoutesGenerator {
  RoutesGenerator._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Auth Routes -------------------------------------------------------------------------------------------------------------
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesManager.welcomeRoute:
        return MaterialPageRoute(builder: (context) => const WelcomeView());
      case RoutesManager.signInRoute:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case RoutesManager.signUpRoute:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      //Task Routes -------------------------------------------------------------------------------------------------------------
      case RoutesManager.tasklistRoute:
        return MaterialPageRoute(builder: (context) => const TaskListView());
      case RoutesManager.taskDetailRoute:
        return MaterialPageRoute(builder: (context) => const TaskDetailView());
      case RoutesManager.taskEditRoute:
        return MaterialPageRoute(builder: (context) => const TaskEditView());
      case RoutesManager.taskCreateRoute:
        return MaterialPageRoute(builder: (context) => const TaskCreateView());

      //Default Route -------------------------------------------------------------------------------------------------------------
      default:
        return MaterialPageRoute(builder: (context) => const UndefinedRoute());
    }
  }
}
