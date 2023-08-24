import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GEOAPIFY_KEY', obfuscate: true)
  static final String geoApifyKey = _Env.geoApifyKey;
  @EnviedField(varName: 'SUPABASE_URL')
  static const String supabaseURL = _Env.supabaseURL;
  @EnviedField(varName: 'SUPABASE_ANONKEY')
  static const String supabaseAnonKey = _Env.supabaseAnonKey;
}
