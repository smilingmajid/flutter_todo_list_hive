import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBarAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  Animation<double> get progressAnimation => _progressAnimation;

  @override
  void onInit() {
    super.onInit();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
