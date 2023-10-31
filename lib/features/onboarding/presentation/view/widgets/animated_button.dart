
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required RiveAnimationController buttonAnimationController,
    required this.onTap,
  }) : _buttonAnimationController = buttonAnimationController;

  final RiveAnimationController _buttonAnimationController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            height: 64,
            width: 260,
            child: RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [_buttonAnimationController],
            ),
          ),
          const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(width: 6),
                  Text(
                    'Start the course',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
