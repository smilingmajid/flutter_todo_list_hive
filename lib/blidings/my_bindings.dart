import 'package:get/get.dart';
import '../controller/date_bottom_controller.dart';
import '../controller/date_controller.dart';
import '../controller/task_controller.dart';
import '../controller/time_controller.dart';
import '../controller/title_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DateBottomController(), fenix: true);
    Get.lazyPut(() => TitleController(), fenix: true);
    Get.lazyPut(() => TaskController(), fenix: true);
    Get.lazyPut(() => DateController(), fenix: true);
     Get.lazyPut(() => TimeController(), fenix: true);
  }
}
