import 'package:get/get.dart';

class ControllerEstadio extends GetxController {
  var estadioName = ''.obs;
  var estadioDate = ''.obs;
  var estadioPlace = ''.obs;
  var estadioOwner = ''.obs;
  var estadioCapacity = ''.obs;
  var estadioStatus = true.obs;
  RxnString errorName = RxnString(null);
  RxnString error = RxnString(null);
}
