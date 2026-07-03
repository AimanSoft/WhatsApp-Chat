import 'message_model.dart';

class ChatDataModel {
  final String name;
  final String imagePath;
  String time;
  String lastMessage;
  int mssgCount;
  List<MessageModel> messages;

  ChatDataModel({
    required this.name,
    required this.imagePath,
    required this.time,
    required this.lastMessage,
    required this.mssgCount,
    List<MessageModel>? messages,
  }) : messages = messages ?? [];

  // تحديث آخر رسالة وعدد الرسائل
  void updateLastMessage(String message) {
    lastMessage = message;
    mssgCount++;
    time = _getCurrentTime();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }
}