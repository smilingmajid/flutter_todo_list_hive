import 'package:get/get.dart';

class TitleController extends GetxController {
  RxBool isShow = false.obs;

  changeShowStatus() {
    isShow.value = !isShow.value;
    update();
  }
}
