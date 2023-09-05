import 'package:freezed_annotation/freezed_annotation.dart';

import '../home/home_model.dart';
part 'details_model.freezed.dart';

@freezed
class DetailsModel with _$DetailsModel {
  const factory DetailsModel({
    required List<int> checked,
    required Recipe recipe,
  }) = _DetailsModel;
}
