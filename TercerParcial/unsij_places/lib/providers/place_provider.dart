import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsij_places/domain/place.dart';

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);

  void addPlace(Place newPlace) {
    state = [newPlace, ...state];
  }

  void removePlace(String id) {
    state = state.where((place) => place.id != id).toList();
  }
}

final placesProvider = StateNotifierProvider<PlaceNotifier, List<Place>>((ref) {
  return PlaceNotifier();
});
