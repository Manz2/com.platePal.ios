import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plate_pal/screens/home/home_model.dart';
part 'home_backend_service.freezed.dart';

abstract class HomeBackendService {
  Future<HomeServiceReturn> filterRecipes(
      bool vegan, bool vege, bool gl, String uid);
  Future<HomeServiceReturn> getAllRecipes(String uid);
}

@freezed
class HomeServiceReturn with _$HomeServiceReturn {
  const factory HomeServiceReturn({
    required List<Recipe> recipes,
  }) = _HomeServiceReturn;
}
