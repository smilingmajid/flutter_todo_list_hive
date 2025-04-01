import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/progressbar_animaton_controller.dart';

class ProgressBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProgressBarAnimationController());
  }
}

class ProgressBarPage extends GetView<ProgressBarAnimationController> {
  const ProgressBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.progressAnimation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  value: controller.progressAnimation.value,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 20),
                Text(
                  '${(controller.progressAnimation.value * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
