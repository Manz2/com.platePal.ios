import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import '../home/home_model.dart';

part 'details_backend_service.freezed.dart';

abstract class DetailsBackendService {
  ErstellenModel recipeToErstellenModel(Recipe recipe, {bool edit = false});
  void deleteRecipe(Recipe recipe);
}

@freezed
class DetailsServiceReturn with _$DetailsServiceReturn {
  const factory DetailsServiceReturn({
    required Recipe recipe,
  }) = _DetailsServiceReturn;
}
