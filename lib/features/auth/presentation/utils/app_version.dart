import 'package:package_info_plus/package_info_plus.dart';

//import 'package:flutter/material.dart';
class AppVersion {
  static String? _currentVersion;
  static Future<void> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _currentVersion=packageInfo.version;
  }
  static String get currentVersion=> _currentVersion ?? '';
}
