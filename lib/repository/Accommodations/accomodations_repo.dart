import 'package:supabase_flutter/supabase_flutter.dart';

import 'Model/accommodations.dart';

class AccommodationsRepo {
  static final _client = Supabase.instance.client;
  get client => _client;
  static Future<List<Accommodations>> getAllAccommodations() async {
    final PostgrestTransformBuilder hotels = _client
        .from('accommodations_boukini')
        .select('name,category,location,price,rating,picture,stars')
        .eq('category', 'Hotel')
        .order('rating', ascending: false)
        .limit(10);
    final villas = _client
        .from('accommodations_boukini')
        .select('name,category,location,price,rating,picture,stars')
        .eq('category', 'Villa')
        .order('rating', ascending: false)
        .limit(10);
    final resH = ((await hotels).data) as List<Accommodations>;
    final resV = ((await villas).data) as List<Accommodations>;
    final res = (resV + resH);
    res.sort((a, b) => a.rating.compareTo(b.rating));
    return res;
  }
}
