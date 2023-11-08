class MessageModel {
  String? type;
  String message;
  String time;
  String path;
  MessageModel({
    required this.message,
    this.type,
    required this.time,
    required this.path,
  });
}
