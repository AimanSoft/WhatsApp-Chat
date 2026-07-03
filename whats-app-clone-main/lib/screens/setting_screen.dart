import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/models/setting_model.dart';

class SettingScreen extends StatelessWidget {
  // const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingModel>(context);
    final TextEditingController cont = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(150),
                  // border: Border.all(width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: ListTile(
                trailing: CircleAvatar(
                  foregroundImage: AssetImage(settings.getImage()),
                  radius: 30,
                ),
                titleTextStyle: const TextStyle(color: Colors.white),
                title: Text(settings.getName()),
              ),
            ),
            TextField(
              controller: cont,
              decoration: InputDecoration(hintText: "insert name..."),
            ),
            IconButton(
                onPressed: () {
                  settings.updateName(cont.text);
                  // settings.name = cont.text;
                },
                icon: Icon(Icons.update))
          ],
        ),
      ),
    );
  }
}
