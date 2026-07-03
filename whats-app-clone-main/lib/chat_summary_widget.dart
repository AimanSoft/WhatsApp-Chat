import 'package:flutter/material.dart';

class ChatSummaryWidget extends StatelessWidget {
  const ChatSummaryWidget(
      {super.key,
      required this.name,
      required this.lastMessage,
      required this.imagePath,
      required this.time,
      required this.mssgCount});
  final String name;
  final String imagePath;
  final String time;
  final String lastMessage;
  final int mssgCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            dismissDirection: DismissDirection.endToStart,
            closeIconColor: Colors.red,
            content: Text("تم النقر", textAlign: TextAlign.right),
            backgroundColor: Colors.lightGreen,
          ),
        );
      },
      onDoubleTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            dismissDirection: DismissDirection.endToStart,
            closeIconColor: Colors.red,
            content: Text("تم النقر مرتين", textAlign: TextAlign.right),
            backgroundColor: Colors.lightBlue,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             CircleAvatar(
              foregroundImage: AssetImage(imagePath),
              radius: 30,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  lastMessage,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                 Row(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                    child: Text(
                      "$mssgCount",
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                   const SizedBox(
                    width: 5,
                  ),
                   const Icon(
                    Icons.check,
                    size: 18,
                    color: Color.fromARGB(147, 255, 255, 255),
                  ),
                ],
              )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
