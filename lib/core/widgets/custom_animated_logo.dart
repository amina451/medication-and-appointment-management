import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLogoAnimation extends StatefulWidget {
  const CustomLogoAnimation({super.key, required this.imageLogo});

  final String imageLogo;

  @override
  State<CustomLogoAnimation> createState() => _CustomLogoAnimationState();
}

class _CustomLogoAnimationState extends State<CustomLogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animatedOffset;

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animatedOffset = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.03),
    ).animate(_animationController);
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animatedOffset,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: SvgPicture.asset(widget.imageLogo),
      ),
    );
  }
}
