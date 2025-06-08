import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_bottom_nav_bar.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Favorites'));
}

class BookView extends StatelessWidget {
  const BookView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Book'));
}

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Messages'));
}

class MainShell extends StatefulWidget {
  final Widget child;
  final String location;

  const MainShell({super.key, required this.child, required this.location});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static const routeIndexMap = {
    '/home': 0,
    '/favorites': 1,
    '/book': 2,
    '/messages': 3,
  };

  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = _calculateCurrentIndex();
  }

  @override
  void didUpdateWidget(covariant MainShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      setState(() {
        _currentIndex = _calculateCurrentIndex();
      });
    }
  }

  int _calculateCurrentIndex() {
    return routeIndexMap.entries
        .firstWhere(
          (e) => widget.location.startsWith(e.key),
          orElse: () => const MapEntry('/home', 0),
        )
        .value;
  }

  void _onTap(int index) {
    if (index == _currentIndex) return;
    final route = routeIndexMap.entries.firstWhere((e) => e.value == index).key;
    GoRouter.of(context).go(route);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: widget.child,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            MainShell(location: state.uri.toString(), child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.home,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritesView(),
          ),
          GoRoute(
            path: '/book',
            name: 'book',
            builder: (context, state) => const BookView(),
          ),
          GoRoute(
            path: '/messages',
            name: 'messages',
            builder: (context, state) => const MessagesView(),
          ),
        ],
      ),
    ],
  );
}
