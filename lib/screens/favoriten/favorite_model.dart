import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plate_pal/screens/home/home_model.dart';

part 'favorite_model.freezed.dart';

@freezed
class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
    required List<Recipe> favoriten,
    required bool hasFetchedOnInit,
  }) = _FavoriteModel;
}
