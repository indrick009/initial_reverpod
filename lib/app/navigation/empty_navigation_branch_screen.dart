import 'package:flutter/material.dart';

class EmptyNavigationBranchScreen extends StatelessWidget {
  const EmptyNavigationBranchScreen({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: Center(child: Text(label)));
  }
}
