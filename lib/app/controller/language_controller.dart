
import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController{
  Locale _currentLocal=Locale('en');
  final List<Locale> _supportedLocal=[
    Locale('en'), // English
    Locale('bn'), // Spanish
  ];
  Locale get currentLocal=> _currentLocal;
  List<Locale> get supportedLocals=> _supportedLocal;
  void changeLocal(Locale locale){
    if(_currentLocal==locale){
      return;
    }
    _currentLocal=locale;
    update();
  }


}