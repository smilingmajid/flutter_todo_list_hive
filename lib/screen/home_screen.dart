import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/task_list_screen.dart';
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
  late Animation<double> _progressAnimation;
  late AnimationController _controller;
  final TaskController taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: taskController.uniqueTitles.length,
                  itemBuilder: (context, index) {
                    final title = taskController.uniqueTitles[index];
                    final percentage =
                        taskController.titleCompletionPercentages[title] ?? 0.0;
                    return Column(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => TaskListScreen(title: title));
                              },
                              child: Container(
                                width: screenWidth * 0.95,
                                height: screenWidth * 1.1,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 193, 7, 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontFamily: 'ClashDisplayRegular',
                                  color: Color.fromARGB(255, 45, 45, 45),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
                                              progress: percentage),
                                        );
                                      },
                                    ),
                                  ),
                                  Text((percentage / 100).toString()),
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
                                  color:
                                      const Color.fromARGB(255, 252, 250, 246),
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
                                          builder: (context) =>
                                              AddNewTaskScreen()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
/*
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: percentage / 100,
                                backgroundColor: Colors.grey[200],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  percentage == 100
                                      ? Colors.green
                                      : Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${percentage.toStringAsFixed(1)}% تکمیل شده',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class VerticalProgressBarPainter extends CustomPainter {
  final double progress; // درصد پیشرفت

  VerticalProgressBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white // رنگ نوار پیشرفت
      ..strokeWidth = 8
      ..style = PaintingStyle.fill // توپر بودن نوار پیشرفت
      ..strokeCap = StrokeCap.round; // گوشه‌های گرد برای نوار پیشرفت

    // رسم پس‌زمینه با گوشه‌های گرد و border
    Paint backgroundPaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 8
      ..style = PaintingStyle.fill // توپر بودن پس‌زمینه
      ..strokeCap = StrokeCap.round; // گوشه‌های گرد برای پس‌زمینه

    // رسم مستطیل با گوشه‌های گرد (پس‌زمینه)
    final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(20));
    canvas.drawRRect(rect, backgroundPaint);

    // رسم border برای پس‌زمینه
    Paint borderPaint = Paint()
      ..color = Colors.white // رنگ حاشیه
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke; // تنها مرز را رسم می‌کند
    canvas.drawRRect(rect, borderPaint);

    // رسم نوار پیشرفت با گوشه‌های گرد
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
