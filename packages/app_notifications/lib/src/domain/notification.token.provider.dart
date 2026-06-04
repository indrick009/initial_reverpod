abstract interface class NotificationTokenProvider {
  Future<String?> getToken();

  Future<void> deleteToken();
}
