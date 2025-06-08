import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
