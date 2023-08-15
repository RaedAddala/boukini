import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GEOAPIFY_KEY', obfuscate: true)
  static final String geoApifyKey = _Env.geoApifyKey;
}
