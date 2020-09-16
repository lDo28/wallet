import 'package:get/get.dart';

class WTabBarController extends GetxController{
  var selectIndex = 0.obs;

  updateIndex(int index){
    if(selectIndex.value == index) return;
    selectIndex.value = index;
  }
}