import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/date_symbol_data_local.dart';

import './config/routes.dart';
import 'utils/material_theme.dart';

Future<void> main() async {
  await initializeDateFormatting('fr_FR', null);
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
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: "Boukini",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.mainScreen,
      getPages: getPages,
    );
  }
}
