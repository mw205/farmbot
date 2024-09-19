import 'package:farmbot/translations/ar_translation.dart';
import 'package:farmbot/translations/en_translation.dart';
import 'package:get/get.dart';

class FarmBotTranslations implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": ArTranslation.arMap,
        "en": EnTranslation.enMap,
      };
}
