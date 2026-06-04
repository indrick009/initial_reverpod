import 'package:app_routing/app_routing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../navigation/app_navigation_destination.dart';
import '../navigation/app_navigation_shell.dart';
import '../navigation/empty_navigation_branch_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: const OpenHomeIntent().location.toString(),
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppNavigationDestination.home.path,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          for (final destination in AppNavigationDestination.values.skip(1))
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: destination.path,
                  builder: (context, state) => EmptyNavigationBranchScreen(
                    label: _sectionLabel(context, destination),
                  ),
                ),
              ],
            ),
        ],
      ),
    ],
  );
});

String _sectionLabel(
  BuildContext context,
  AppNavigationDestination destination,
) {
  final l10n = AppLocalizations.of(context);

  return destination.label(l10n);
}
