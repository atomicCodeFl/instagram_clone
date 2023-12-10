import 'package:flutter/material.dart';
import 'package:instagram_clone/user_story/user_story_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Instagram clone',
      home: UserStoryScreen(),
    );
  }
}
