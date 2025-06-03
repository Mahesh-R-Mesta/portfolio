import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? serialNo;
  final String title;
  const CustomAppBar({super.key, this.serialNo, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Container(color: Colors.black, width: 50, height: 3),
        const SizedBox(width: 5),
        if (serialNo != null) Text(serialNo!, style: theme.bodyMedium),
        const SizedBox(width: 10),
        Text(title, style: theme.titleLarge?.copyWith(fontSize: 25)),
      ]),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 90);
}
