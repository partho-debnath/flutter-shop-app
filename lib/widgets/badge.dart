import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final Widget child;
  final int value;
  final Color color;
  const MyBadge({
    super.key,
    required this.child,
    required this.value,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        child,
        Positioned(
          top: 4,
          right: 1,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            constraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
