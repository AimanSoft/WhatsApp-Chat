class MessageModel {
  final String text;
  final bool isSentByMe;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.isSentByMe,
    required this.timestamp,
  });

  // تحويل الكائن إلى Map لتخزينه لاحقاً
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isSentByMe': isSentByMe,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // إنشاء كائن من Map
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      text: map['text'],
      isSentByMe: map['isSentByMe'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}