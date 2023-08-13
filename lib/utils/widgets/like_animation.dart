import 'package:flutter/material.dart';

class LikeAmination extends StatefulWidget {
  //child is to make the like animation the parent widget
  final Widget child;
  final bool isAnimating;
  //duration tells us how long the like animation continues
  final Duration duration;
  //this will be called to stop the like animation
  final VoidCallback? onEnd;
  //to check if lke button is cliicked or not
  final bool smallLike;

  const LikeAmination({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
    this.smallLike = false,
  }) : super(key: key);

  @override
  State<LikeAmination> createState() => _LikeAminationState();
}

class _LikeAminationState extends State<LikeAmination>
    with SingleTickerProviderStateMixin {
  late AnimationController contoller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    contoller = AnimationController(
      vsync: this,
      // ~/2 divides the duration in milliseconds by 2 and convert it into int
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(contoller);
  }

  @override
  void didUpdateWidget(covariant LikeAmination oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.isAnimating || widget.smallLike) {
      await contoller.forward();
      await contoller.reverse();
      await Future.delayed(
        const Duration(
          milliseconds: 200,
        ),
      );

      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
