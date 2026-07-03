import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/models/setting_model.dart';
import 'package:whats_app_clone/whats_app_home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsAppHome(),
    );
  }
}