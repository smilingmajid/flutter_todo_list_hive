import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import 'add_new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  final TaskController taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tasks"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    width: screenWidth * 0.95,
                    height: screenWidth * 1.1,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 193, 7, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Title",
                      style: GoogleFonts.oxygenMono(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 45, 45, 45),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.025,
                    bottom: screenWidth * 0.025,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: screenHeight * 0.2,
                          child: AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, child) {
                              return CustomPaint(
                                painter: VerticalProgressBarPainter(
                                    progress: _progressAnimation.value),
                              );
                            },
                          ),
                        ),
                        const Text("data"),
                      ],
                    ),
                  ),
                  Positioned(
                    right: screenWidth * 0.025,
                    bottom: screenWidth * 0.025,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 252, 250, 246),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromRGBO(255, 193, 7, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewTaskScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalProgressBarPainter extends CustomPainter {
  final double progress;

  VerticalProgressBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 8
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(20));
    canvas.drawRRect(rect, backgroundPaint);

    Paint borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(rect, borderPaint);

    double progressHeight = size.height * progress;
    final progressRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
          0, size.height - progressHeight, size.width, progressHeight),
      const Radius.circular(20),
    );
    canvas.drawRRect(progressRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
