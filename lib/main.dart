import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hotel_booking/config/consume_services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './config/routes.dart';
import 'utils/style/material_theme.dart';

bool firstTime = true;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  LicenseRegistry.addLicense(() async* {
    final comfortaalicense =
        await rootBundle.loadString('google_fonts/ComfortaaOFL.txt');
    final alegreyalicense =
        await rootBundle.loadString('google_fonts/AlegreyaOFL.txt');

    yield LicenseEntryWithLineBreaks(['google_fonts'], comfortaalicense);
    yield LicenseEntryWithLineBreaks(['google_fonts'], alegreyalicense);
  });
  await initializeDateFormatting('fr_FR', null);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  firstTime = sharedPreferences.getBool('firstTime') ?? true;
  await sharedPreferences.setBool('firstTime', false);
  //if(!firstTime) Services.init(); // Initializes services that are needed globally.

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      title: "Boukini",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.welcome,
      getPages: getPages,
    );
  }
}
