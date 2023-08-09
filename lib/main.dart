import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;

import './config/routes.dart';
import 'utils/material_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  LicenseRegistry.addLicense(() async* {
    final lektonlicense =
        await rootBundle.loadString('google_fonts/LektonOFL.txt');
    final montasseratlicense =
        await rootBundle.loadString('google_fonts/MontserratOFL.txt');

    yield LicenseEntryWithLineBreaks(['google_fonts'], lektonlicense);
    yield LicenseEntryWithLineBreaks(['google_fonts'], montasseratlicense);
  });
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
      initialRoute: Routes.home,
      getPages: getPages,
    );
  }
}
