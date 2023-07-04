import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plate_pal/screens/gruppe/gruppe_model.dart';
part 'gruppe_backend_service.freezed.dart';

abstract class GruppeBackendService {
  Future<GruppeServiceReturn> getGroupMembers(String uid);
  Future<bool> addNewMember(String id, String ownId);
  Future<bool> removeMember(String id, String ownId);
}

@freezed
class GruppeServiceReturn with _$GruppeServiceReturn {
  const factory GruppeServiceReturn({
    required List<Member> members,
  }) = _GruppeServiceReturn;
}
