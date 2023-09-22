import 'package:supabase_flutter/supabase_flutter.dart';

import 'Model/accommodations.dart';

class AccommodationsRepo {
  static final _client = Supabase.instance.client;
  get client => _client;
  static Future<List<Accommodations>> getAllAccommodations() async {
    final PostgrestTransformBuilder hotels = _client
        .from('accommodations_boukini')
        .select('id,name,category,location,price,rating,picture,stars')
        .eq('category', 'Hotel')
        .order('rating', ascending: false)
        .limit(10);
    final villas = _client
        .from('accommodations_boukini')
        .select('id,name,category,location,price,rating,picture,stars')
        .eq('category', 'Villa')
        .order('rating', ascending: false)
        .limit(10);

    List<Accommodations> resH = [];
    List<Accommodations> resV = [];

    for (var element in ((await hotels) as List<dynamic>)) {
      resH.add(Accommodations.fromJson(element));
    }
    for (var element in ((await villas) as List<dynamic>)) {
      resH.add(Accommodations.fromJson(element));
    }

    final res = (resV + resH);
    res.sort((a, b) => b.rating.compareTo(a.rating));
    return res;
  }

  static Future<AccommodationDetails?> getAccommodationById(int id) async {
    final PostgrestTransformBuilder hotel = _client
        .from('accommodations_boukini')
        .select()
        .eq('id', id)
        .maybeSingle();
    final Map<String, dynamic>? res = await hotel;
    return (res != null) ? AccommodationDetails.fromJson(res) : null;
  }
}
