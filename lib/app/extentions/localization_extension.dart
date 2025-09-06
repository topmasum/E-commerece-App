import 'package:flutter/cupertino.dart';
import 'package:ui_based_ecommerce/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localization{
    return AppLocalizations.of(this)!;
  }
}