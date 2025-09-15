import 'package:get/get.dart';

class MainNavController extends GetxController{
  int _selectedIndex=0;
  int get currentIndex=> _selectedIndex;
  void changedIndex(int index){
    if(_selectedIndex== index){
      return;
    }
    _selectedIndex=index;
    update();
  }
}