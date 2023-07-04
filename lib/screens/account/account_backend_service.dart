import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_backend_service.freezed.dart';

abstract class AccountBackendService {
  Future<String> getUserImage({required String userId});
  Future<void> setUserImage({required String uid, required String imageString});
  Future<AccountServiceReturn> getUserName(String uid);
}

@freezed
class AccountServiceReturn with _$AccountServiceReturn {
  const factory AccountServiceReturn({
    required String name,
  }) = _AccountServiceReturn;
}
