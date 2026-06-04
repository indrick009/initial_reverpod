final class NotificationMessage {
  const NotificationMessage({
    required this.id,
    required this.title,
    required this.body,
    this.payload = const <String, String>{},
    this.channelId = 'default',
    this.channelName = 'Default',
  });

  final String id;
  final String title;
  final String body;
  final Map<String, String> payload;
  final String channelId;
  final String channelName;
}
