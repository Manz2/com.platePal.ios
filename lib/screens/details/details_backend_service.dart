import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';

import '../home/home_model.dart';

part 'details_backend_service.freezed.dart';

abstract class DetailsBackendService {
  Future<DetailsServiceReturn> getRecipe(String id, String uid);
  Future<bool> updateRecipe(Recipe recipe, String uid);
  Future<void> toggleFavorite(String id, bool isFavorite, String creator);
  Future<bool> isFavorite(String id, String uid);
  ErstellenModel recipeToErstellenModel(Recipe recipe, {bool edit = false});
}

@freezed
class DetailsServiceReturn with _$DetailsServiceReturn {
  const factory DetailsServiceReturn({
    required Recipe recipe,
  }) = _DetailsServiceReturn;
}
