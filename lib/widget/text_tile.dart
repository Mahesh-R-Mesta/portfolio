import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String? title;
  final String? description;
  const TextTile({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: Colors.orange),
          ),
        if (description != null) ...[
          const SizedBox(height: 10),
          Text(description ?? "NA", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500))
        ],
      ],
    );
  }
}
