import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

enum AppNavigationDestination {
  home(path: '/', icon: Icons.home_outlined, selectedIcon: Icons.home),
  products(
    path: '/products',
    icon: Icons.grid_view_outlined,
    selectedIcon: Icons.grid_view,
  ),
  orders(
    path: '/orders',
    icon: Icons.receipt_long_outlined,
    selectedIcon: Icons.receipt_long,
  ),
  messages(
    path: '/messages',
    icon: Icons.chat_bubble_outline,
    selectedIcon: Icons.chat_bubble,
  ),
  account(
    path: '/account',
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
  );

  const AppNavigationDestination({
    required this.path,
    required this.icon,
    required this.selectedIcon,
  });

  final String path;
  final IconData icon;
  final IconData selectedIcon;

  String label(AppLocalizations l10n) {
    return switch (this) {
      AppNavigationDestination.home => l10n.navHome,
      AppNavigationDestination.products => l10n.navProducts,
      AppNavigationDestination.orders => l10n.navOrders,
      AppNavigationDestination.messages => l10n.navMessages,
      AppNavigationDestination.account => l10n.navAccount,
    };
  }
}
