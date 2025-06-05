import 'package:flutter/material.dart';

class DifferLoad extends StatelessWidget {
  final Future<dynamic>? future;
  final Widget Function(BuildContext) builder;
  const DifferLoad({super.key, this.future, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) return builder.call(ctx);
          return Center(child: CircularProgressIndicator(color: Colors.amber));
        });
  }
}
