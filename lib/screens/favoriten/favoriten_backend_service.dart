import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plate_pal/screens/home/home_model.dart';
part 'favoriten_backend_service.freezed.dart';

abstract class FavoritenBackendService {
  Future<FavoritenServiceReturn> filterFavorites(
      String id, bool vegan, bool vege, bool gl);
  Future<FavoritenServiceReturn> getFavorites(String uid);
  Future<bool> isFavorite(String id, String uid);
}

@freezed
class FavoritenServiceReturn with _$FavoritenServiceReturn {
  const factory FavoritenServiceReturn({
    required List<Recipe> recipes,
  }) = _FavoritenServiceReturn;
}
