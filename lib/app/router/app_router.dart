import 'package:app_routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: const OpenHomeIntent().location.toString(),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const _BootstrapHomeScreen(),
      ),
    ],
  );
});

class _BootstrapHomeScreen extends StatelessWidget {
  const _BootstrapHomeScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(body: Center(child: Text(l10n.homeTitle)));
  }
}
