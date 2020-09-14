import 'package:get/get.dart';

class WTabBarController extends GetxController{
  var selectIndex = 0.obs;

  updateIndex(int index){
    selectIndex.value = index;
  }
}