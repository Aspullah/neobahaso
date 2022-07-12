import 'package:flutter/material.dart';
import 'package:neobahaso/utils/colors.dart';

class SharedSafeAreaWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool top;
  final bool bottom;

  const SharedSafeAreaWidget({
    Key? key,
    required this.child,
    this.color = SharedColors.primary1Color,
    this.top = false,
    this.bottom = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: child,
        top: top,
        bottom: bottom,
      ),
    );
  }
}
