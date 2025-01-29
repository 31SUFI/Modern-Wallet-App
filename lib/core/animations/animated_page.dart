import 'package:flutter/material.dart';
import 'slide_animation.dart';

class AnimatedPage extends StatefulWidget {
  final Widget child;

  const AnimatedPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with TickerProviderStateMixin, SlideAnimation {
  @override
  Widget build(BuildContext context) {
    return slideAnimation(child: widget.child);
  }
}
