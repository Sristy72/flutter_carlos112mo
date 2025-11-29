import 'package:flutter_carlos112mo/core/base/base_controller.dart';
import 'package:get/get.dart';

class BookFieldController extends BaseController{
  var selectedHour = 1.obs;

  void selectHour(int hour) {
    selectedHour.value = hour;
  }
}