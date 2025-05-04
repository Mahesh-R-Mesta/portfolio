import 'package:flutter/material.dart';

class IconExpress extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconExpress({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 25), const SizedBox(height: 20), Text(text, style: Theme.of(context).textTheme.labelSmall)],
    );
  }
}
