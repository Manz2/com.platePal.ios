import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plate_pal/screens/home/home_model.dart';

part 'erstellen_model.freezed.dart';

@freezed
class ErstellenModel with _$ErstellenModel {
  const factory ErstellenModel(
      {required String name,
      required String id,
      required List<Ingredient> requiredIngredients,
      required List<String> steps,
      required String description,
      required bool glutenfrei,
      required bool vegan,
      required bool vegetarisch,
      required String fileType,
      required Future<Uint8List> image,
      required bool nameNotSet,
      required bool ingridientNotSet,
      required bool stepsNotSet,
      required bool descriptionNotSet,
      required bool isImport,
      required String? webURL,
      required bool weburlNotSet,
      required bool isValidUrl,
      required bool isEdit}) = _ErstellenModel;
}
