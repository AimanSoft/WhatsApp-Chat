import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/chat_summary_widget.dart';
import 'package:whats_app_clone/custom_search_widget.dart';
import 'package:whats_app_clone/models/chat_data_model.dart';
import 'package:whats_app_clone/models/message_model.dart';
import 'package:whats_app_clone/models/setting_model.dart';
import 'package:whats_app_clone/screens/calls_screen.dart';
import 'package:whats_app_clone/screens/chat_details_screen.dart';
import 'package:whats_app_clone/screens/chats_screen.dart';
import 'package:whats_app_clone/screens/groups_screen.dart';
import 'package:whats_app_clone/screens/recents_screen.dart';
import 'package:whats_app_clone/screens/setting_screen.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  List<ChatDataModel> chatList = [
    ChatDataModel(
      name: "أحمد",
      imagePath: "assets/images/image_1.jpg",
      time: "2:30",
      lastMessage: "مرحباً! كيف حالك؟",
      mssgCount: 3,
      messages: [
        MessageModel(
          text: "مرحباً أحمد! كيف حالك؟",
          isSentByMe: false,
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        MessageModel(
          text: "أهلاً! أنا بخير، شكراً. ماذا تفعل؟",
          isSentByMe: true,
          timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 55)),
        ),
        MessageModel(
          text: "أتعلم Flutter حالياً",
          isSentByMe: false,
          timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 50)),
        ),
      ],
    ),
    ChatDataModel(
      name: "سعيد",
      imagePath: "assets/images/image_2.jpg",
      time: "3:30",
      lastMessage: "السلام عليكم",
      mssgCount: 2,
      messages: [
        MessageModel(
          text: "السلام عليكم",
          isSentByMe: false,
          timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        ),
        MessageModel(
          text: "وعليكم السلام ورحمة الله",
          isSentByMe: true,
          timestamp: DateTime.now().subtract(const Duration(hours: 2, minutes: 55)),
        ),
      ],
    ),
    ChatDataModel(
      name: "علي",
      imagePath: "assets/images/image_3.jpg",
      time: "1:30",
      lastMessage: "شكراً جزيلاً",
      mssgCount: 20,
    ),
    ChatDataModel(
      name: "خالد",
      imagePath: "assets/images/image_4.jpg",
      time: "3:50",
      lastMessage: "أحب البرمجة",
      mssgCount: 1,
    ),
  ];
  
  int _currentIndex = 3;
  final List<Widget> _pages = const [
    CallsScreen(),
    GroupsScreen(),
    RecentsScreen(),
    ChatsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100), 
          child: CustomSearchWidget()
        ),
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SettingScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // يمكنك إضافة كاميرا هنا
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("فتح الكاميرا")),
                  );
                },
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(right: 16.0),
          alignment: Alignment.centerRight,
          child: Text(
            "واتساب ${settings.getName()}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailsScreen(
                    chatData: chatList[index],
                  ),
                ),
              );
            },
            child: ChatSummaryWidget(
              name: chatList[index].name,
              lastMessage: chatList[index].lastMessage,
              time: chatList[index].time,
              imagePath: chatList[index].imagePath,
              mssgCount: chatList[index].mssgCount,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          // إضافة محادثة جديدة
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("بدء محادثة جديدة")),
          );
        },
        child: const Icon(
          Icons.add_comment,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call), 
            label: "المكالمات"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_3_outlined), 
            label: "المجتمعات"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh), 
            label: "التحديثات"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment), 
            label: "الدردشات"
          ),
        ],
      ),
    );
  }
}