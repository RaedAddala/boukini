import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hotel_booking/config/consume_services.dart';
import 'package:hotel_booking/config/globals.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'env/env.dart';
import 'firebase_options.dart';

import './config/routes.dart';
import 'utils/style/material_theme.dart';

bool _firstTime = true;

Future<void> main() async {
  Globals.connected = false;
  Globals.servicesInitialized = false;

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final futureFirebase = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final futureSupabase = Supabase.initialize(
    url: Env.supabaseURL,
    anonKey: Env.supabaseAnonKey,
  );
  final futureIntlInitialisation = initializeDateFormatting('fr_FR', null);
  final futureSharedPreferencesInstance = SharedPreferences.getInstance();

  await futureFirebase;
  await futureSupabase;
  await futureIntlInitialisation;

  LicenseRegistry.addLicense(() async* {
    final comfortaalicense =
        await rootBundle.loadString('google_fonts/ComfortaaOFL.txt');
    final alegreyalicense =
        await rootBundle.loadString('google_fonts/AlegreyaOFL.txt');

    yield LicenseEntryWithLineBreaks(['google_fonts'], comfortaalicense);
    yield LicenseEntryWithLineBreaks(['google_fonts'], alegreyalicense);
  });
  SharedPreferences sharedPreferences = await futureSharedPreferencesInstance;
  // _firstTime = sharedPreferences.getBool('firstTime') ?? true;
  // Globals.connected = sharedPreferences.getBool('connected') ?? false;
  // await sharedPreferences.setBool('firstTime', false);

  if (!_firstTime) {
    Services.init(); // Initializes services that are needed globally.
    Globals.servicesInitialized = true;
  }

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
      initialRoute: Routes.dashboard,
      // _firstTime
      // ? Routes.welcome
      // : Globals.connected
      //     ? Routes.dashboard
      //     : Routes.phoneNumber,
      getPages: getPages,
    );
  }
}
