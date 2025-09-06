import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app/app.dart';
import 'package:ui_based_ecommerce/app/extentions/localization_extension.dart';

class LanguageChangeSwitch extends StatelessWidget {
  const LanguageChangeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.localization.selectedLanguage),
      trailing: DropdownMenu<Locale>(
        dropdownMenuEntries: CraftyBay.languageController.supportedLocals.map((
          locale,
        ) {
          return DropdownMenuEntry(
            value: locale,
            label:locale.languageCode);
        }).toList(),
        onSelected: (Locale? locale) {
          CraftyBay.languageController.changeLocal(locale!);
        },
      ),
    );
  }
}
