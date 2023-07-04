class UserCancelledException implements Exception {
  final String message;

  UserCancelledException(this.message);

  @override
  String toString() => 'UserCancelledException: $message';
}
