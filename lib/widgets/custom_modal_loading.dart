import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomModalLoading extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget? progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  CustomModalLoading({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator,
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset == null)
      layOutProgressIndicator = Center(
        child: progressIndicator ??
            Lottie.asset(
              'assets/lottie/loading.json',
              width: 250,
            ),
      );
    else {
      layOutProgressIndicator = Positioned(
        child: progressIndicator!,
        left: offset?.dx,
        top: offset?.dy,
      );
    }

    return Stack(
      children: [
        child,
        Opacity(
          child: ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
