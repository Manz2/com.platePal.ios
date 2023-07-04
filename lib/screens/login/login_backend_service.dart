abstract class LoginBackendService {
  Future<bool> firstLogin(String uid);
  void createUser(String uid, String name);
}
