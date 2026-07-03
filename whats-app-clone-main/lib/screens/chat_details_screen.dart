import 'package:flutter/material.dart';
import 'package:whats_app_clone/models/chat_data_model.dart';
import 'package:whats_app_clone/models/message_model.dart';
import 'package:whats_app_clone/widgets/message_bubble.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key, required this.chatData});

  final ChatDataModel chatData;

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final newMessage = MessageModel(
      text: text,
      isSentByMe: true,
      timestamp: DateTime.now(),
    );

    setState(() {
      widget.chatData.messages.add(newMessage);
      _messageController.clear();
    });

    // التمرير إلى آخر رسالة
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // محاكاة الرد التلقائي (يمكنك إزالة هذا لاحقاً)
    _simulateReply();
  }

  void _simulateReply() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        final replyMessage = MessageModel(
          text: "أهلاً! كيف حالك؟",
          isSentByMe: false,
          timestamp: DateTime.now(),
        );

        setState(() {
          widget.chatData.messages.add(replyMessage);
        });

        // التمرير إلى آخر رسالة
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A), // خلفية واتساب الداكنة
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2C34),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(widget.chatData.imagePath),
            ),
            const SizedBox(width: 10),
            Text(
              widget.chatData.name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 30),
        ],
      ),
      body: Column(
        children: [
          // عرض الرسائل
          Expanded(
            child: widget.chatData.messages.isEmpty
                ? const Center(
                    child: Text(
                      "لا توجد رسائل بعد\nابدأ المحادثة الآن",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: widget.chatData.messages.length,
                    itemBuilder: (context, index) {
                      final message = widget.chatData.messages[index];
                      return MessageBubble(message: message);
                    },
                  ),
          ),
          // حقل إدخال النص
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: const BoxDecoration(
              color: Color(0xFF1F2C34),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions, color: Colors.white54),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "اكتب رسالة...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF2A3942),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF00A884)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}