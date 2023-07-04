// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'account_model.freezed.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel(
      {required String name,
      required String image,
      required int fontSize}) = _AccountModel;
}
