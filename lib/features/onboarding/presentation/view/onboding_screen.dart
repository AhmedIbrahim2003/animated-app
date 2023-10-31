import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/features/onboarding/presentation/view/widgets/animated_button.dart';

import 'widgets/sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool inShowDialog = false;
  late RiveAnimationController _buttonAnimationController;
  @override
  void initState() {
    _buttonAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.sizeOf(context).width * 1.7,
            left: 100,
            bottom: 200,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: inShowDialog ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 260,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                                fontSize: 60,
                                height: 1.2,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                              'Don\'t Skip design. Learn design and code, by building real apps with Flutter and Swift. Complete course about the best tools')
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedButton(
                      buttonAnimationController: _buttonAnimationController,
                      onTap: () {
                        _buttonAnimationController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 800), (() {
                          setState(() {
                            inShowDialog = true;
                          });
                          signInDialog(context, onClose: (_) {
                            setState(() {
                              inShowDialog = false;
                            });
                          });
                        }));
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          'Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificats'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
