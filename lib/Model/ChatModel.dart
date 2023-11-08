class ChatModel {
  String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool? select = false;
  int id;
  ChatModel({
    required this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select,
    required this.id,
  });
}
